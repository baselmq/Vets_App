import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Theme/theme_status.dart';
import '../../../Theme/app_colors.dart';

// Size(135.w, 43.h)
class SimpleOutlinedBtn extends StatelessWidget {
  const SimpleOutlinedBtn({
    super.key,
    required String text,
    Size? minimumSize,
    Color? colorBtn,
    Color? colorText,
    double? fontSize,
    required Function() onTap,
  })  : _onTap = onTap,
        _text = text,
        _minimumSize = minimumSize,
        _colorBtn = colorBtn,
        _colorText = colorText,
        _fontSize = fontSize;

  final void Function()? _onTap;
  final String _text;
  final Size? _minimumSize;
  final Color? _colorBtn;
  final Color? _colorText;
  final double? _fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OutlinedButton(
      onPressed: _onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: _minimumSize ?? Size(size.width, 45.h),
        side: BorderSide(color: _colorBtn ?? AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
      child: Text(
        _text,
        style: AppTheme.bodyMedium(context: context)?.copyWith(
            color: _colorText ?? AppColors.primary, fontSize: _fontSize),
      ),
    );
  }
}
