import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Services/Theme/change_theme.dart';
import '../../../Theme/app_colors.dart';
import '../Auth/views/wrapper.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({super.key});
  static const String id = 'PageSplash';

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 3000),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Wrapper.id);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Scaffold(
      backgroundColor: themes.isDark ? AppColors.darkLight : AppColors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              PathImage.logo,
              width: 170.w,
            ),
            // SizedBox(height: 20.h),
            // Text(
            //   'Vets App',
            //   style: AppTheme.titleLarge(context: context)
            //       ?.copyWith(color: AppColors.primary, fontSize: 30.sp),
            // ),
            SizedBox(
              width: 250.0,
              child: TextLiquidFill(
                text: 'Vets App',
                loadUntil: 1,
                waveColor: AppColors.primary,
                boxBackgroundColor: AppColors.white,
                loadDuration: const Duration(seconds: 3),
                waveDuration: const Duration(seconds: 2),
                textStyle: AppTheme.titleLarge(context: context)!
                    .copyWith(color: AppColors.primary, fontSize: 30.sp),
                boxHeight: 80.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
