import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Components/details_bg_image.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    super.key,
    required String title,
    double height = 250,
    double widthImage = 140,
  })  : _title = title,
        _height = height,
        _widthImage = widthImage;
  final String _title;
  final double _height;
  final double _widthImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height.h,
      child: Stack(
        children: [
          const DetailsBgImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  PathImage.logoWhite,
                  width: _widthImage.w,
                ),
                SizedBox(height: 20.h),
                Text(
                  _title,
                  style: AppTheme.titleLarge(context: context)
                      ?.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
