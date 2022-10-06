import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ! Components
import '../../../Theme/app_colors.dart';
import 'enum_loading.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key, required TypeLoading type, double size = 45})
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
        return SpinKitSquareCircle(color: colorLoading, size: _size.sp);

      case TypeLoading.image:
        return SpinKitFadingCircle(color: colorLoading, size: _size.sp);
      case TypeLoading.page:
        return SpinKitPulse(color: colorLoading, size: _size.sp);

      case TypeLoading.webPage:
        return SpinKitWanderingCubes(color: colorLoading, size: _size.sp);
      case TypeLoading.button:
        return SpinKitFadingCircle(
            itemBuilder: (_, __) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.colorLogo),
                  shape: BoxShape.circle,
                ),
              );
            },
            size: _size.sp);

      default:
        return SpinKitFadingCircle(color: colorLoading, size: _size.sp);
    }
  }
}
