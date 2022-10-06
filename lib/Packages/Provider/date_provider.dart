import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  changeDate(date) {
    selectedDate = date;
    notifyListeners();
  }
}
