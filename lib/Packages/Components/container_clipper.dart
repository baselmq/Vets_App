import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Components/Clipper/clipper_radius.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerClipper extends StatelessWidget {
  const ContainerClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperRadius(),
      child: BackgroundContainer(
        height: 300.h,
        width: double.infinity,
        child: const Text('data'),
      ),
    );
  }
}
