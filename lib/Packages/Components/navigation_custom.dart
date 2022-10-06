import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/util/path_icons.dart';

import '../../Services/Theme/change_theme.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {required this.indexPage, required this.onPress, Key? key})
      : super(key: key);
  final int indexPage;
  final Function(int) onPress;
  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context);

    return CurvedNavigationBar(
      height: 65.0,
      color: themes.isDark ? AppColors.darkLight : AppColors.white,
      buttonBackgroundColor: AppColors.primary,
      backgroundColor: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      items: [
        Icon(
          Icons.article,
          color: indexPage == 0 ? AppColors.onPrimary : AppColors.navGray,
        ),
        PathIcons.stethoscope(
          color: indexPage == 1 ? AppColors.onPrimary : AppColors.navGray,
        ),
        Icon(
          Icons.person,
          color: indexPage == 2 ? AppColors.onPrimary : AppColors.navGray,
        ),
      ],
      onTap: (value) {
        onPress(value);
      },
    );
  }
}
