import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ! Components
import '../../../Theme/app_colors.dart';
import 'enum_loading.dart';

class AppAnimationLoading extends StatelessWidget {
  const AppAnimationLoading(
      {Key? key, required TypeLoading type, double size = 45})
      : _typeLoading = type,
        _size = size,
        super(key: key);

  final TypeLoading _typeLoading;
  final double _size;

  @override
  Widget build(BuildContext context) {
    // bool isDark = AppTheme.getTheme(context: context);
    Color colorLoading = AppColors.primary;
    // isDark ? AppColors.darkLoading : AppColors.lightLoading;
    switch (_typeLoading) {
      case TypeLoading.profile:
        return LoadingAnimationWidget.discreteCircle(
            color: colorLoading, size: _size.sp);

      case TypeLoading.image:
        return LoadingAnimationWidget.discreteCircle(
            color: colorLoading, size: _size.sp);
      case TypeLoading.page:
        return LoadingAnimationWidget.staggeredDotsWave(
            color: colorLoading, size: _size.sp);

      case TypeLoading.webPage:
        return LoadingAnimationWidget.stretchedDots(
            color: colorLoading, size: _size.sp);
      case TypeLoading.button:
        return LoadingAnimationWidget.threeArchedCircle(
            color: colorLoading, size: _size.sp);

      default:
        return LoadingAnimationWidget.threeArchedCircle(
            color: colorLoading, size: _size.sp);
    }
  }
}
