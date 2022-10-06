import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/components/rating/average_rate.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_vet.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/cache_image/image_user.dart';
import '../../../Doctor/DetailsDr/view/dr_details.dart';

class CardChoiceVet extends StatelessWidget {
  const CardChoiceVet({
    super.key,
    required ModelVet vet,
  }) : _vet = vet;
  final ModelVet _vet;

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: themes.isDark ? AppColors.darkLight : AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageDrDetails(vet: _vet),
                    ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageUser(
                    imageUrl: _vet.image ?? PathImage.notFoundUserPng,
                    radius: 32,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _vet.firstName! + _vet.lastName!,
                        style: AppTheme.bodyMedium(context: context),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        _vet.location!,
                        style: AppTheme.bodySmall(context: context)
                            ?.copyWith(color: AppColors.gray),
                      ),
                      SizedBox(height: 10.h),
                      _vet.type == 'vet'
                          ? Container(
                              height: 18.h,
                              width: 140.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: AppColors.available,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Text(
                                KeyLang.available.tr(),
                                style: AppTheme.bodySmall(context: context)
                                    ?.copyWith(color: AppColors.green),
                              ),
                            )
                          : Container(
                              height: 16.5.h,
                              width: 159.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: AppColors.notAvailable,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Text(
                                KeyLang.notAvailable.tr(),
                                style: AppTheme.bodySmall(context: context)
                                    ?.copyWith(color: AppColors.red),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
          ),
        ),
        context.locale == const Locale('en', 'US')
            ? Positioned(
                right: 22,
                top: 25,
                child: AverageRate(
                  vet: _vet,
                  showNumReviews: false,
                ),
              )
            : Positioned(
                left: 22,
                top: 25,
                child: AverageRate(
                  vet: _vet,
                  showNumReviews: false,
                ),
              ),
      ],
    );
  }
}
// class CardChoiceDr extends StatelessWidget {
//   const CardChoiceDr({
//     super.key,
//     required String imageUrl,
//     required String name,
//     required String location,
//     required bool available,
//   })  : _imageUrl = imageUrl,
//         _name = name,
//         _location = location,
//         _available = available;
//   final String _imageUrl;
//   final String _name;
//   final String _location;
//   final bool _available;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(15.w),
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PageDrDetails(),
//                     ));
//               },
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ImageCircle(
//                     imageUrl: _imageUrl,
//                     radius: 32,
//                   ),
//                   SizedBox(width: 10.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         _name,
//                         style: AppTheme.bodyMedium(context: context),
//                       ),
//                       SizedBox(height: 5.h),
//                       Text(
//                         _location,
//                         style: AppTheme.bodySmall(context: context)
//                             ?.copyWith(color: AppColors.gray),
//                       ),
//                       SizedBox(height: 10.h),
//                       _available
//                           ? Container(
//                               height: 16.5.h,
//                               width: 136.w,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 7.w, vertical: 2.h),
//                               decoration: BoxDecoration(
//                                   color: AppColors.available,
//                                   borderRadius: BorderRadius.circular(20.r)),
//                               child: Text(
//                                 'available in the clinic',
//                                 style: AppTheme.bodySmall(context: context)
//                                     ?.copyWith(color: AppColors.green),
//                               ),
//                             )
//                           : Container(
//                               height: 16.5.h,
//                               width: 159.w,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 7.w, vertical: 2.h),
//                               decoration: BoxDecoration(
//                                   color: AppColors.notAvailable,
//                                   borderRadius: BorderRadius.circular(20.r)),
//                               child: Text(
//                                 'Not available in the clinic',
//                                 style: AppTheme.bodySmall(context: context)
//                                     ?.copyWith(color: AppColors.red),
//                               ),
//                             ),
//                     ],
//                   ),
//                   SizedBox(width: 20.w),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 35,
//           top: 25,
//           child: Row(
//             children: [
//               Icon(
//                 Icons.star_rounded,
//                 color: AppColors.primary,
//                 size: 17.sp,
//               ),
//               SizedBox(width: 2.w),
//               Text(
//                 '4.3',
//                 style: AppTheme.bodySmall(context: context),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
