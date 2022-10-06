import 'package:flutter/material.dart';

class DataBooking extends ChangeNotifier {
  String? _userId;
  String? _vetId;
  String? _date;
  String? _time;

  // * get
  String? get userId => _userId;
  String? get vetId => _vetId;
  String? get date => _date;
  String? get time => _time;

  // * set
  set setUserId(String val) {
    _userId = val;
    notifyListeners();
  }

  set setVetId(String val) {
    _vetId = val;
    notifyListeners();
  }

  set setDate(String val) {
    _date = val;
    notifyListeners();
  }

  set setTime(String val) {
    _time = val;
    notifyListeners();
  }
}
