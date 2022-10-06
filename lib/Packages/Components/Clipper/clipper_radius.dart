import 'package:flutter/material.dart';

class CustomClipperRadius extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // path.moveTo(0, size.height * 0.6017500);
    // path.quadraticBezierTo(size.width * 0.0063000, size.height * 0.5306250,
    //     size.width * 0.0885333, size.height * 0.5299687);
    // path.cubicTo(
    //     size.width * 0.2549333,
    //     size.height * 0.5299687,
    //     size.width * 0.7457000,
    //     size.height * 0.5285313,
    //     size.width * 0.9121000,
    //     size.height * 0.5285313);
    // path.quadraticBezierTo(size.width * 0.9951000, size.height * 0.5300313,
    //     size.width, size.height * 0.6014687);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width * 0.0033333, 0);
    // path.lineTo(0, size.height * 0.6017500);

    path.moveTo(0, size.height * 0.8497500);
    path.quadraticBezierTo(size.width * 0.0032667, size.height * 0.7497500,
        size.width * 0.0933333, size.height * 0.7502000);
    path.cubicTo(
        size.width * 0.2928667,
        size.height * 0.7501500,
        size.width * 0.7035667,
        size.height * 0.7499000,
        size.width * 0.9069000,
        size.height * 0.7496500);
    path.quadraticBezierTo(size.width * 0.9959333, size.height * 0.7504000,
        size.width, size.height * 0.8481000);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.8497500);

    // path.moveTo(0, size.height * 0.8000800);
    // path.quadraticBezierTo(size.width * 0.0039143, size.height * 0.7119200,
    //     size.width * 0.0631714, size.height * 0.7121200);
    // path.cubicTo(
    //     size.width * 0.0632857,
    //     size.height * 0.7122800,
    //     size.width * 0.9372000,
    //     size.height * 0.7119200,
    //     size.width * 0.9370857,
    //     size.height * 0.7118400);
    // path.quadraticBezierTo(size.width * 0.9986000, size.height * 0.7117600,
    //     size.width, size.height * 0.7998800);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.8000800);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
