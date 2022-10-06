import 'package:flutter/material.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    Key? key,
    required this.title,
    this.fillIcon = false,
    this.centerTitle = true,
    this.icon,
    this.actions,
  }) : super(key: key);
  final String title;
  final bool fillIcon;
  final bool centerTitle;
  final Widget? icon;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.titleLarge(context: context)
            ?.copyWith(color: AppColors.white),
      ),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: Colors.transparent,
      // iconTheme: IconThemeData(color: Colors.grey[600]),
      leading: fillIcon ? icon : Container(width: 0),
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size(double.infinity, AppBar().preferredSize.height);
}
