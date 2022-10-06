import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../Components/cache_image/image_user.dart';
import '/Theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '/Theme/theme_status.dart';
import '/util/path_icons.dart';

class CardBookingUser extends StatelessWidget {
  const CardBookingUser({
    super.key,
    required String imageUrl,
    required String name,
    required String subText,
    required String bookingTime,
    required String bookingDate,
  })  : _imageUrl = imageUrl,
        _name = name,
        _subText = subText,
        _bookingTime = bookingTime,
        _bookingDate = bookingDate;

  final String _imageUrl;
  final String _name;
  final String _subText;
  final String _bookingTime;
  final String _bookingDate;

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: themes.isDark ? AppColors.darkLight : AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: themes.isDark
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  offset: const Offset(0.0, 1.0), //(x,y)
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageUser(radius: 35, imageUrl: _imageUrl),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5.h),
                              Text(
                                _name,
                                style: AppTheme.bodyMedium(context: context)
                                    ?.copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                _subText,
                                style: AppTheme.bodySmall(context: context)
                                    ?.copyWith(
                                        color: AppColors.gray, fontSize: 13.sp),
                              ),
                              SizedBox(height: 8.h),
                              context.locale == const Locale('en', 'US')
                                  ? Row(
                                      children: [
                                        PathIcons.calendarDays(
                                            color: AppColors.primary),
                                        SizedBox(width: 5.w),
                                        Text(
                                          _bookingDate,
                                          style: AppTheme.bodySmall(
                                                  context: context)
                                              ?.copyWith(fontSize: 13.sp),
                                        ),
                                        SizedBox(width: 10.w),
                                        PathIcons.clock(
                                            color: AppColors.primary),
                                        SizedBox(width: 5.w),
                                        Text(
                                          _bookingTime,
                                          style: AppTheme.bodySmall(
                                                  context: context)
                                              ?.copyWith(fontSize: 13.sp),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          _bookingTime,
                                          style: AppTheme.bodySmall(
                                                  context: context)
                                              ?.copyWith(fontSize: 13.sp),
                                        ),
                                        SizedBox(width: 5.w),
                                        PathIcons.clock(
                                            color: AppColors.primary),
                                        SizedBox(width: 10.w),
                                        Text(
                                          _bookingDate,
                                          style: AppTheme.bodySmall(
                                                  context: context)
                                              ?.copyWith(fontSize: 13.sp),
                                        ),
                                        SizedBox(width: 5.w),
                                        PathIcons.calendarDays(
                                            color: AppColors.primary),
                                      ],
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.all(10.w),
                  height: 65.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: AppColors.orange1,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        KeyLang.upcoming.tr(),
                        style: AppTheme.bodySmall(context: context)
                            ?.copyWith(color: AppColors.yellowOrange),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
