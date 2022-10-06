import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer(
      {super.key, required Widget child, double? width, double? height})
      : _child = child,
        _height = height,
        _width = width;
  final Widget _child;
  final double? _height;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width ?? double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.colorLogo,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: _child,
    );
  }
}
