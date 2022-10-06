import 'package:flutter/material.dart';

class AppTheme {
// * status Mode
  static bool getTheme({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // * titleLarge
  static TextStyle? titleLarge(
      {required BuildContext context}) {
    return Theme.of(context).textTheme.titleLarge;
  }

  // * titleMedium
  static TextStyle? titleMedium(
      {required BuildContext context}) {
    return Theme.of(context).textTheme.titleMedium;
  }

  // * titleSmall
  static TextStyle? titleSmall({required BuildContext context}) {
    return Theme.of(context).textTheme.titleSmall;
  }

  // * bodyText1
  static TextStyle? b1({required BuildContext context}) {
    return Theme.of(context).textTheme.bodyText1;
  }

  // * bodyLarge
  static TextStyle? bodyLarge(
      {required BuildContext context}) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  // * bodyMedium
  static TextStyle? bodyMedium(
      {required BuildContext context}) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  // * bodySmall
  static TextStyle? bodySmall(
      {required BuildContext context}) {
    return Theme.of(context).textTheme.bodySmall;
  }
}
