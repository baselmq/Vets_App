import 'package:flutter/material.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/cache_image/image_user.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

// ? PageDrHome
class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required String backgroundImage,
    required String backgroundImageAr,
    required String circleImage,
    required String nameUser,
    required String text,
  })  : _backgroundImage = backgroundImage,
        _backgroundImageAr = backgroundImageAr,
        _circleImage = circleImage,
        _nameUser = nameUser,
        _text = text;
  final String _backgroundImage;
  final String _backgroundImageAr;
  final String _circleImage;
  final String _nameUser;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        context.locale == const Locale('en', 'US')
            ? Image.asset(_backgroundImage)
            : Image.asset(_backgroundImageAr),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ImageUser(radius: 32.r, imageUrl: _circleImage),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                KeyLang.hello.tr(),
                style: AppTheme.bodyMedium(context: context)
                    ?.copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                _nameUser,
                style: AppTheme.bodyMedium(context: context)
                    ?.copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                _text,
                style: AppTheme.bodySmall(context: context)
                    ?.copyWith(color: AppColors.onPrimary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
