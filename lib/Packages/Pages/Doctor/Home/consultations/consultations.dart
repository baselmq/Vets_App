import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Time/format_date.dart';
import 'package:vets_app/Packages/Pages/Doctor/Appointments/components/card_appointments.dart';
import 'package:vets_app/Packages/Pages/Doctor/Home/consultations/no_consultation.dart';
import '../../../../../Language/generated/key_lang.dart';
import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Authentication/store_services.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../DetailsDr/models/model_booking.dart';

class Consultations extends StatelessWidget {
  const Consultations({super.key});

  @override
  Widget build(BuildContext context) {
    StoreServices store = Provider.of<StoreServices>(context, listen: false);

    return StreamBuilder(
        stream: StoreServices().getCurrentListBookings(store.userData.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AppAnimationLoading(type: TypeLoading.page),
            );
          }
          if (snapshot.data!.isNotEmpty) {
            return CurrentBooking(
                length: snapshot.data!.length, snapshot: snapshot);
          } else {
            return const CardNoConsultation();
          }
        });
  }
}

class CurrentBooking extends StatelessWidget {
  const CurrentBooking(
      {super.key, required this.length, required this.snapshot});
  final int length;
  final AsyncSnapshot<List<ModelBooking>> snapshot;

  @override
  Widget build(BuildContext context) {
    StoreServices store = Provider.of<StoreServices>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            KeyLang.upcomingConsultation.tr(),
            style: AppTheme.titleSmall(context: context),
          ),
        ),
        SizedBox(
          height: 270.h,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final snap = snapshot.data![index];
              if (snap.vetId == store.userData.uid) {
                return formatDate(snap.dateBooking!, 'dd/MM/yyyy') ==
                        formatDate(DateTime.now().toString(), 'dd/MM/yyyy')
                    ? ShowBooking(
                        idDoc: snap.id!,
                        idUser: snap.userId!,
                        idVet: snap.vetId!,
                        time: snap.timeBooking!,
                        date: snap.dateBooking!,
                      )
                    : Container(width: 0);
              } else {
                return  Container(width: 0);
              }
            },
          ),
        ),
      ],
    );
  }
}

class ShowBooking extends StatelessWidget {
  const ShowBooking({
    Key? key,
    required this.idUser,
    required this.time,
    required this.date,
    required this.idVet,
    required this.idDoc,
  }) : super(key: key);

  final String idDoc;
  final String idUser;
  final String idVet;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    GetData getData = Provider.of<GetData>(context, listen: false);
    return SizedBox(
      width: 330.w,
      child: StreamBuilder(
        stream: StoreServices().getUserDetails(idUser),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('SomTing went wrong ${snapshot.error}'),
              // child: AppAnimationLoading(type: TypeLoading.page),
            );
          }
          if (snapshot.hasData) {
            getData.setModelUser = snapshot.data;
            var data = getData.modelUser;
            return CardAppointments(
                imageUrl: data!.image!,
                name: '${data.firstName!} ${data.lastName!}',
                subText: 'subText',
                bookingTime: time,
                bookingDate: formatDate(date, 'MMMd'));
          } else {
            return Container(width: 0);
          }
        },
      ),
    );
  }
}
