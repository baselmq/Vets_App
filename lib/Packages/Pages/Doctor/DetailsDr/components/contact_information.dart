import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/Btn/simple_elevated_btn.dart';
import 'package:vets_app/Packages/Components/Btn/simple_outlined_btn.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/components/rating/average_rate.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/components/split_days.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/view/rating_vet.dart';
import 'package:vets_app/Packages/Pages/User/models/model_favorite.dart';

import '../../../../../Services/Authentication/store_services.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../../util/key_firebase.dart';
import '../../../../Components/favorite.dart';
import '../../../Auth/models/model_vet.dart';
import 'button_booking.dart';
import 'package:easy_localization/easy_localization.dart';

// ? PageDrDetails
class ContactInformation extends StatefulWidget {
  const ContactInformation({
    super.key,
    required ModelVet vet,
  }) : _vet = vet;
  final ModelVet _vet;

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  final ModelFavorite _modelFavorite = ModelFavorite();
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    StoreServices store = Provider.of<StoreServices>(context, listen: false);
    SplitDays.workday(widget._vet.workdays!, ',');
    SplitDays.holidays(widget._vet.holidays!, ',');

    return Stack(
      children: [
        Positioned(
          right: 30,
          top: 20,
          child: BtnFavorite(
            favorite: favorite,
            onPress: () async {
              if (favorite) {
                setState(() {
                  favorite = false;
                });
                await FirebaseFirestore.instance
                    .collection(KeyFirebase.colFavorite)
                    .get()
                    .then((QuerySnapshot querySnapshot) {
                  for (var doc in querySnapshot.docs) {
                    if (doc[KeyFirebase.vetId] == widget._vet.id) {
                      var id = doc.id;
                      var deleteFavorite = FirebaseFirestore.instance
                          .collection(KeyFirebase.colFavorite)
                          .doc(id);
                      deleteFavorite.delete();
                    }
                  }
                });
              } else {
                setState(() {
                  favorite = true;
                });
                _modelFavorite.vetId = widget._vet.id;
                _modelFavorite.userId = store.userData.uid;
                _modelFavorite.favorite = favorite.toString();
                // * save in DataBase info user
                bool result =
                    await store.addFavorite(modelFavorite: _modelFavorite);
                if (result) {
                  store.setLoading = false;
                } else {
                  store.setLoading = false;
                }
              }
            },
          ),
        ),
        Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              '${widget._vet.firstName} ${widget._vet.lastName}',
              style: AppTheme.titleMedium(context: context),
            ),
            SizedBox(height: 10.h),

            // * rating
            AverageRate(vet: widget._vet),
            // RatingBarIndicator(
            //   rating: 3,
            //   itemCount: 5,
            //   itemSize: 20,
            //   direction: Axis.horizontal,
            //   itemBuilder: (context, index) {
            //     return Icon(Icons.star_rate_rounded, color: AppColors.primary);
            //   },
            // ),
            SizedBox(height: 5.h),
            Text(
              '${widget._vet.location}',
              style: AppTheme.bodyMedium(context: context)
                  ?.copyWith(color: AppColors.gray),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_iphone_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
                SizedBox(width: 2.h),
                Text('${widget._vet.phone}'),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${SplitDays.splitWorkday.first} - ${SplitDays.splitWorkday.last}, ${widget._vet.hourFrom} - ${widget._vet.hoursUntil}'),
                SizedBox(width: 10.h),
                Text(
                  '${SplitDays.splitHolidays.first} - ${SplitDays.splitHolidays.last}: ${KeyLang.closed.tr()}',
                  style: AppTheme.bodyLarge(context: context)
                      ?.copyWith(color: AppColors.gray),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleOutlinedBtn(
                  minimumSize: Size(110.w, 40.w),
                  text: KeyLang.rating.tr(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RateVet(vet: widget._vet),
                        ));
                  },
                ),
                SizedBox(width: 20.w),
                SimpleElevatedBtn(
                  minimumSize: Size(110.w, 40.w),
                  text: KeyLang.bookNow.tr(),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ButtonBooking(
                          vetId: widget._vet.id!,
                          nameVet:
                              '${widget._vet.firstName!} ${widget._vet.lastName!}'),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ],
    );
  }
}


// return Stack(
//   children: [
//     Positioned(
//         child: SimpleElevatedBtn(
//       minimumSize: const Size(20, 30),
//       text: 'Rate',
//       onTap: () {
//         Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => RateVet(vet: _vet),
//                 ));
//       },
//     )),
//     Column(
//       children: [
//         SizedBox(height: 40.h),
//         Text(
//           '${_vet.firstName} ${_vet.lastName}',
//           style: AppTheme.titleMedium(context: context),
//         ),
//         SizedBox(height: 10.h),

//         // * rating Bar
//         RatingBarIndicator(
//           rating: 3,
//           itemCount: 5,
//           itemSize: 20,
//           direction: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Icon(Icons.star_rate_rounded, color: AppColors.primary);
//           },
//         ),
//         SizedBox(height: 5.h),
//         Text(
//           '${_vet.location}',
//           style: AppTheme.bodyMedium(context: context)
//               ?.copyWith(color: AppColors.gray),
//         ),
//         SizedBox(height: 5.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.phone_iphone_rounded,
//               color: AppColors.primary,
//               size: 20,
//             ),
//             SizedBox(width: 2.h),
//             Text('${_vet.phone}'),
//           ],
//         ),
//         SizedBox(height: 10.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Sun - Thu, ${_vet.hourFrom} - ${_vet.hoursUntil}'),
//             SizedBox(width: 10.h),
//             Text(
//               'Fri - Sat: Closed',
//               style: AppTheme.bodyLarge(context: context)
//                   ?.copyWith(color: AppColors.gray),
//             ),
//           ],
//         ),
//         SizedBox(height: 5.h),
//       ],
//     ),
//   ],
// );
