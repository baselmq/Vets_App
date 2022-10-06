import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0553143, size.height);
    path0.cubicTo(
        size.width * 0.1621143,
        size.height * 0.7840000,
        size.width * 0.4573714,
        size.height * 0.8513333,
        size.width * 0.6392571,
        size.height * 0.7315000);
    path0.cubicTo(
        size.width * 0.7856286,
        size.height * 0.6174333,
        size.width * 0.7737143,
        size.height * 0.4037333,
        size.width,
        size.height * 0.3287333);
    path0.quadraticBezierTo(
        size.width, size.height * 0.4965500, size.width, size.height);
    path0.quadraticBezierTo(size.width * 0.7638286, size.height,
        size.width * 0.0553143, size.height);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
