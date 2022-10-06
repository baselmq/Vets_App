import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/util/key_firebase.dart';
import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Authentication/store_services.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/Time/format_date.dart';
import '../../../../Components/Toast/simple_toast.dart';
import '../../../../Provider/appointment_provider.dart';
import '../../DetailsDr/models/model_booking.dart';
import '../components/booking_vet.dart';
import 'package:easy_localization/easy_localization.dart';
class ChangeCurrentBooking extends StatefulWidget {
  const ChangeCurrentBooking(
      {super.key, required this.length, required this.snapshot});
  final int length;
  final AsyncSnapshot<List<ModelBooking>> snapshot;

  @override
  State<ChangeCurrentBooking> createState() => _ChangeCurrentBookingState();
}

class _ChangeCurrentBookingState extends State<ChangeCurrentBooking> {
  int currentBooking = 0;

// * Check whether there is vet's data or not
  // bool checkData() {
  //   for (var i = 0; i < widget.snapshot.data!.length; i++) {
  //     if (widget.snapshot.data![i].vetId == StoreServices().userData.uid) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  //   return false;
  // }

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
           KeyLang.bookingNow.tr(),
            style: AppTheme.titleSmall(context: context),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 185.h,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentBooking = value;
              });
            },
            scrollDirection: Axis.horizontal,
            itemCount: widget.snapshot.data!.length,
            itemBuilder: (context, index) {
              final snap = widget.snapshot.data![index];
              if (snap.vetId == store.userData.uid) {
                return ShowBookingVet(
                  idDoc: snap.id!,
                  idUser: snap.userId!,
                  idVet: snap.vetId!,
                  time: snap.timeBooking!,
                  date: snap.dateBooking!,
                );
              } else {
                return Container(width: 0);
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.snapshot.data!.length,
              (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 6,
                    width: currentBooking == index ? 20 : 6,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: currentBooking == index
                          ? AppColors.primary
                          : AppColors.gray,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  )),
        )
      ],
    );
  }
}

// !---------------------------------------------------------------------
class ShowBookingVet extends StatefulWidget {
  const ShowBookingVet({
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
  State<ShowBookingVet> createState() => _ShowBookingVetState();
}

class _ShowBookingVetState extends State<ShowBookingVet> {
  final ModelBooking _modelBooking = ModelBooking();

  // String formatDate(String selectedDate, String pattern) {
  //   DateFormat format = DateFormat(pattern);

  //   String formatted = format.format(DateTime.parse(selectedDate));
  //   return formatted;
  // }

  @override
  Widget build(BuildContext context) {
    GetData getData = Provider.of<GetData>(context, listen: false);
    final StoreServices store = Provider.of<StoreServices>(context);
    AppointmentProvider date = Provider.of<AppointmentProvider>(context);

    return SizedBox(
      width: 330.w,
      child: StreamBuilder(
        stream: StoreServices().getUserDetails(widget.idUser),
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
            return CardBookingVet(
              imageUrl: data!.image!,
              name: data.firstName!,
              animalType: 'subText',
              bookingTime: widget.time,
              bookingDate: formatDate(widget.date, 'MMMd'),
              accept: () async {
                _modelBooking.id = widget.idDoc;
                _modelBooking.vetId = widget.idVet;
                _modelBooking.userId = widget.idUser;
                _modelBooking.dateBooking = widget.date;
                _modelBooking.timeBooking = widget.time;

                // * save in DataBase info user
                bool result = await store.addCollectionBookings(
                    modelBooking: _modelBooking,
                    collection: KeyFirebase.colCurrentList);

                bool resultColUser = await store.addCollectionBookingsUser(
                    modelBooking: _modelBooking);
                // * check successfully or Failed
                if (result) {
                  if (resultColUser) {
                    store.setLoading = false;
                    store.deleteWaitingList(
                        idVet: widget.idVet, idUser: widget.idUser);
                  } else {
                    store.setLoading = false;
                    simpleToast(message: store.errorMessage);
                  }
                } else {
                  store.setLoading = false;
                  simpleToast(message: store.errorMessage);
                }
              },
              reject: () async {
                _modelBooking.id = widget.idDoc;
                _modelBooking.vetId = widget.idVet;
                _modelBooking.userId = widget.idUser;
                _modelBooking.dateBooking = widget.date;
                _modelBooking.timeBooking = widget.time;

                bool result = await store.addCollectionBookings(
                    modelBooking: _modelBooking,
                    collection: KeyFirebase.colDeleteList);
                if (result) {
                  store.setLoading = false;
                  store.deleteWaitingList(
                      idVet: widget.idVet, idUser: widget.idUser);
                }
              },
            );
          } else {
            return Container(width: 0);
          }
        },
      ),
    );
  }
}

class ChangeIndex extends ChangeNotifier {
  int _currentBooking = 0;

  int get currentBooking => _currentBooking;

  set setCurrentBooking(int value) {
    _currentBooking = value;
    notifyListeners();
  }
}
