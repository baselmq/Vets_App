import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Theme/app_colors.dart';
import '../../../Theme/theme_status.dart';

class SimpleElevatedBtn extends StatelessWidget {
  const SimpleElevatedBtn({
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

    return ElevatedButton(
      onPressed: _onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: _minimumSize ?? Size(size.width, 45.h),
        backgroundColor: _colorBtn ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
      child: Text(
        _text,
        style: AppTheme.bodyMedium(context: context)?.copyWith(
            color: _colorText ?? AppColors.white, fontSize: _fontSize),
      ),
    );
  }
}
