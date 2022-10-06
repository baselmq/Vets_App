import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // // path.moveTo(100, 100);
    // path.lineTo(0, size.height / 2);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height / 2);
    // path.lineTo(size.width, 0);

    // path.lineTo(0, size.height / 2);
    // path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
    //     size.height / 2, size.width, size.height * 0.9);
    // path.lineTo(size.width, 0);

    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width / 2, height, width, height - 40);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
  //  double height = size.height;
  //   double width = size.width;
  //   path.lineTo(0, height - 50);
  //   path.quadraticBezierTo(width / 2, height, width, height - 50);
  //   path.lineTo(width, 0);
  //   path.close();