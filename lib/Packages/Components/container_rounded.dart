import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerRounded extends StatelessWidget {
  const ContainerRounded({Key? key, required this.color, required this.child})
      : super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      // margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(top: 18.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: child,
    );
  }
}
