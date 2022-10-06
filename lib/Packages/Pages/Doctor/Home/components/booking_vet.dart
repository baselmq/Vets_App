import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:vets_app/util/path_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../Components/Btn/simple_elevated_btn.dart';
import '../../../../Components/Btn/simple_outlined_btn.dart';
import '../../../../Components/cache_image/image_user.dart';

// ? PageDrHome
class CardBookingVet extends StatelessWidget {
  const CardBookingVet({
    super.key,
    required String imageUrl,
    required String name,
    required String animalType,
    required String bookingTime,
    required String bookingDate,
    required Function() accept,
    required Function() reject,
  })  : _imageUrl = imageUrl,
        _name = name,
        _animalType = animalType,
        _bookingTime = bookingTime,
        _bookingDate = bookingDate,
        _accept = accept,
        _reject = reject;
  final String _imageUrl;
  final String _name;
  final String _animalType;
  final String _bookingTime;
  final String _bookingDate;
  final Function() _accept;
  final Function() _reject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.colorLogo,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageUser(radius: 30, imageUrl: _imageUrl),
                  SizedBox(width: 20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Text(
                        _name,
                        style: AppTheme.bodyMedium(context: context)
                            ?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          PathIcons.paw(color: AppColors.onPrimary),
                          SizedBox(width: 5.w),
                          Text(
                            _animalType,
                            style: AppTheme.bodySmall(context: context)
                                ?.copyWith(color: AppColors.onPrimary),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          PathIcons.calendarDays(color: AppColors.white),
                          SizedBox(width: 5.w),
                          Text(
                            _bookingDate,
                            style: AppTheme.bodySmall(context: context)
                                ?.copyWith(color: AppColors.white),
                          ),
                          SizedBox(width: 10.w),
                          PathIcons.clock(color: AppColors.white),
                          SizedBox(width: 5.w),
                          Text(
                            _bookingTime,
                            style: AppTheme.bodySmall(context: context)
                                ?.copyWith(color: AppColors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleOutlinedBtn(
                    text: KeyLang.reject.tr(),
                    minimumSize: Size(120.w, 38.w),
                    colorBtn: AppColors.yellowOrange,
                    colorText: AppColors.white,
                    fontSize: 13.sp,
                    onTap: _reject,
                  ),
                  SimpleElevatedBtn(
                    text:  KeyLang.accept.tr(),
                    minimumSize: Size(120.w, 38.w),
                    colorBtn: AppColors.white,
                    colorText: AppColors.primary,
                    fontSize: 13.sp,
                    onTap: _accept,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
