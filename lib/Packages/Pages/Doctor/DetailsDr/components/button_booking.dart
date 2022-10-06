import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/Toast/result_toast.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_waiting_booking.dart';
import 'package:vets_app/Services/Firestore/booking_data.dart';

import '../../../../../Services/Authentication/store_services.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../Components/Btn/simple_elevated_btn.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import '../../../../Components/Time/date_picker.dart';
import '../../../../Components/Time/time_picker.dart';
import '../../../../Components/Toast/simple_toast.dart';
import 'generate_id_doc.dart';
import 'package:easy_localization/easy_localization.dart';

// ? PageDrDetails
class ButtonBooking extends StatefulWidget {
  const ButtonBooking(
      {Key? key, required String vetId, required String nameVet})
      : _vetId = vetId,
        _nameVet = nameVet,
        super(key: key);
  final String _vetId;
  final String _nameVet;
  @override
  State<ButtonBooking> createState() => _ButtonBookingState();
}

class _ButtonBookingState extends State<ButtonBooking> {
  // * Storage
  final ModelWaitingList _waitingList = ModelWaitingList();

  @override
  Widget build(BuildContext context) {
    final StoreServices store = Provider.of<StoreServices>(context);
    final DataBooking dataBooking = Provider.of<DataBooking>(context);
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: themes.isDark ? AppColors.darkLight : AppColors.white,
                borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(KeyLang.selectDayAndDate.tr()),
                  SizedBox(height: 15.h),
                  const DatePickerCustom(),
                  const SimpleTimePicker(),
                  SizedBox(height: 20.h),
                  Center(
                    child: store.isLoading
                        ? const AppAnimationLoading(type: TypeLoading.button)
                        : SimpleElevatedBtn(
                            text: KeyLang.bookNow.tr(),
                            minimumSize: Size(150.w, 45.w),
                            onTap: () async {
                              // * check image provider
                              if (dataBooking.date == null) {
                                simpleToast(
                                    message: KeyLang.pleaseSelectDate.tr());
                              } else {
                                if (dataBooking.time == null) {
                                  simpleToast(
                                      message: KeyLang.pleaseSelectTime.tr());
                                } else {
                                  _waitingList.id = generateIdDoc();
                                  _waitingList.vetId = widget._vetId;
                                  _waitingList.userId = store.userData.uid;
                                  _waitingList.dateBooking = dataBooking.date;
                                  _waitingList.timeBooking = dataBooking.time;

                                  // * save in DataBase info user
                                  bool result =
                                      await store.addCollectionWaiting(
                                          waitingList: _waitingList,
                                          vetName: widget._nameVet);

                                  // * check successfully or Failed

                                  if (result) {
                                    store.setLoading = false;
                                    if (!mounted) return;
                                    Navigator.pop(context);
                                    simpleToastOk(
                                        message:
                                            KeyLang.successfullyBooked.tr());
                                  } else {
                                    store.setLoading = false;
                                    simpleToast(message: store.errorMessage);
                                  }
                                }
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
