import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Theme/app_colors.dart';

import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/cache_image/image_user.dart';

class CardMyPets extends StatelessWidget {
  const CardMyPets({
    super.key,
    required String imageUrl,
    required String name,
  })  : _imageUrl = imageUrl,
        _name = name;
  final String _imageUrl;
  final String _name;

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Container(
      width: 266.w,
      decoration: BoxDecoration(
        color: themes.isDark ? AppColors.darkLight : AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageUser(
              imageUrl: _imageUrl,
              radius: 32,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _name,
                  style: AppTheme.bodyMedium(context: context),
                ),
                SizedBox(height: 5.h),
                Text(
                  'cat',
                  style: AppTheme.bodySmall(context: context)
                      ?.copyWith(color: AppColors.gray),
                ),
                SizedBox(height: 10.h),
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
