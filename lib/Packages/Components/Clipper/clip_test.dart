import 'package:flutter/material.dart';

class CustomClipperTest extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6611842, size.width,
        size.height * 0.9763158);
    path0.cubicTo(
        size.width * 0.7176857,
        size.height * 1.0384912,
        size.width * 0.7354571,
        size.height * 0.9312632,
        size.width * 0.5001429,
        size.height * 0.9325263);
    path0.cubicTo(
        size.width * 0.2752857,
        size.height * 0.9243860,
        size.width * 0.2867714,
        size.height * 1.0417193,
        0,
        size.height * 0.9743860);
    path0.quadraticBezierTo(0, size.height * 0.6676316, 0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
