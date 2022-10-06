import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Theme/app_colors.dart';

import '../../../../Services/Theme/change_theme.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    Key? key,
    required this.svgPath,
    required this.onTap,
    this.svgWidth = 15,
    this.backgroundColor,
  }) : super(key: key);
  final String svgPath;
  final double svgWidth;
  final Color? backgroundColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
            ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: 19.r,
        backgroundColor: backgroundColor ?? themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
        child: SvgPicture.asset(
          svgPath,
          width: svgWidth.w,
        ),
      ),
    );
  }
}
