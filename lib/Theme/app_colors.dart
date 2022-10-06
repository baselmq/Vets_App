import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFFdddddd
  static Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static final Color primary = _colorFromHex('#f07b2d');
  static final Color bgColor = _colorFromHex('#f1f4f5');
  static final Color ceriseRed = _colorFromHex('#E1306C');
  static final Color red = _colorFromHex('#d12f2f');
  static final Color red2 = _colorFromHex('#E63930');
  static final Color notAvailable = _colorFromHex('#F7EDED');
  static final Color white = _colorFromHex('#ffffff');
  static final Color black = _colorFromHex('#000000');
  static final Color dark = _colorFromHex('#121212');
  static final Color darkWidget = _colorFromHex('#3B3B3B');
  static final Color darkLight = _colorFromHex('#1e1e1e');
  static final Color gray = _colorFromHex('#8b929a');
  static final Color greyIconAdd = _colorFromHex('#9c9da2');
  static final Color greyLight = _colorFromHex('#D7DCDE');

  static final Color yellowOrange = _colorFromHex('#ffbf67');
  static final Color onPrimary = _colorFromHex('#ffcd88');
  static final Color green = _colorFromHex('#78bc77');
  static final Color available = _colorFromHex('#edf8ed');
  static final Color navGray = _colorFromHex('#899098');
  static final Color orange1 = _colorFromHex('#e26a29');
  static final Color orange2 = _colorFromHex('#e9732b');
  static final Color orange3 = _colorFromHex('#ef792d');
  static final Color orange4 = _colorFromHex('#f4802e');
  static final List<Color> colorLogo = [
    orange1,
    orange2,
    orange3,
    orange4,
  ];
}
