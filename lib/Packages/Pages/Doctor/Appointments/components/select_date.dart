import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Pages/Doctor/Appointments/components/card_appointments.dart';
import 'package:vets_app/Packages/Pages/Doctor/Appointments/components/no_appointments.dart';

import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Authentication/store_services.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import '../../../../Provider/appointment_provider.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  @override
  Widget build(BuildContext context) {
    AppointmentProvider date = Provider.of<AppointmentProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 6, left: 10),
      child: DatePicker(
        DateTime.now(),
        width: 60.w,
        height: 75.h,
        initialSelectedDate: date.selectedDate,
        selectionColor: AppColors.primary,
        deactivatedColor: AppColors.green,
        dateTextStyle: AppTheme.titleLarge(context: context)!
            .copyWith(color: AppColors.gray),
        dayTextStyle: AppTheme.bodySmall(context: context)!
            .copyWith(color: AppColors.gray),
        monthTextStyle: AppTheme.bodySmall(context: context)!
            .copyWith(color: AppColors.gray),
        onDateChange: (newDate) {
          date.setSelectedDate = newDate;
        },
      ),
    );
  }
}

class ShowBookingByDate extends StatelessWidget {
  const ShowBookingByDate({super.key});

  @override
  Widget build(BuildContext context) {
    StoreServices store = Provider.of<StoreServices>(context, listen: false);
    AppointmentProvider date = Provider.of<AppointmentProvider>(context);
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return StreamBuilder(
        stream: StoreServices().getCurrentListBookings(store.userData.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 432.h,
              child: Scaffold(
                backgroundColor:
                    themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
                body: const Center(
                  child: AppAnimationLoading(type: TypeLoading.webPage),
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return SizedBox(
                height: 432.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final snap = snapshot.data![index];
                    if (snap.dateBooking == date.selectedDate.toString()) {
                      return ShowBookingByVet(
                          idDoc: snap.id!,
                          idUser: snap.userId!,
                          idVet: snap.vetId!,
                          time: snap.timeBooking!,
                          date: snap.dateBooking!);
                    } else {
                      return Container(width: 0);
                    }
                  },
                ),
              );
            } else {
              return const NoAppointments();
            }
          } else {
            return const NoAppointments();
          }
        });
  }
}

class Test extends StatelessWidget {
  const Test(
      {super.key,
      required this.idDoc,
      required this.idUser,
      required this.idVet,
      required this.time,
      required this.date});
  final String idDoc;
  final String idUser;
  final String idVet;
  final String time;
  final String date;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StoreServices().getUserDetails(idUser),
      builder: (context, snapshot) {
        return Text(idUser);
      },
    );
  }
}

class ShowBookingByVet extends StatelessWidget {
  const ShowBookingByVet({
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
                bookingDate: date);
          } else {
            return Container(width: 0);
          }
        },
      ),
    );
  }
}
