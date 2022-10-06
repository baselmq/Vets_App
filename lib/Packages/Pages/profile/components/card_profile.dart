import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';

import '../../../../Services/Theme/change_theme.dart';

class CardProfile extends StatelessWidget {
  const CardProfile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);
  final String title;
  final Widget icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            color: themes.isDark ? AppColors.darkLight : AppColors.white,
            // gradient: LinearGradient(
            //   colors: AppColors.colorLogo,
            //   begin: Alignment.centerRight,
            //   end: Alignment.centerLeft,
            // ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ListTile(
            onTap: onPress,
            minVerticalPadding: 0,
            // horizontalTitleGap: 0.0,
            // contentPadding: const EdgeInsets.all(0),
            minLeadingWidth: 22.w,
            leading: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: icon,
            ),
            title: Text(title, style: AppTheme.bodyMedium(context: context)),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: 20.h)
      ],
    );
  }
}
