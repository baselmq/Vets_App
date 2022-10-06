import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_status.dart';

class SimpleBtn extends StatelessWidget {
  const SimpleBtn({
    super.key,
    required String text,
    void Function()? onTap,
  })  : _onTap = onTap,
        _text = text;

  final void Function()? _onTap;
  final String _text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        borderRadius: BorderRadius.circular(25.r),
        onTap: _onTap,
        child: Container(
          width: size.width,
          height: 40.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.colorLogo,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            _text.toUpperCase(),
            style: AppTheme.titleMedium(context: context)
                ?.copyWith(color: AppColors.white),
          ),
        ));
  }
}
