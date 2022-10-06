import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Theme/app_colors.dart';
import '../../util/path_icons.dart';

class BtnFavorite extends StatelessWidget {
  const BtnFavorite({Key? key, required this.onPress, required this.favorite})
      : super(key: key);
  final Function() onPress;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.r),
      onTap: onPress,
      child: Container(
        height: 28,
        width: 28,
        padding: EdgeInsets.all(7.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: favorite
              ? const Color(0xFFFF7643).withOpacity(0.15)
              : const Color(0xFF979797).withOpacity(0.1),
        ),
        child: SvgPicture.asset(
          PathIcons.heartIcon2,
          color: favorite ? AppColors.primary : const Color(0xFFDBDEE4),
        ),
      ),
    );
  }
}
