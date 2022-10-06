import 'package:flutter/material.dart';

class VetData extends ChangeNotifier {
  // ModelVet? _modelVet;
  String? _typeUser;
  String? _fName;
  String? _lName;
  String? _phone;
  String? _pathImage;
  String? _location;
  String? _workdays;
  String? _holidays;
  String? _hourFrom;
  String? _hoursUntil;
  // * get
  String? get typeUser => _typeUser;
  String? get fName => _fName;
  String? get lName => _lName;
  String? get phone => _phone;
  String? get pathImage => _pathImage;
  String? get location => _location;
  String? get workdays => _workdays;
  String? get holidays => _holidays;
  String? get hourFrom => _hourFrom;
  String? get hoursUntil => _hoursUntil;
  // ModelVet? get modelVet => _modelVet;

  // * set
  // set setModelVet(ModelVet val) {
  //   _modelVet = val;
  // }

  set setTypeUser(String val) {
    _typeUser = val;
    notifyListeners();
  }

  set setFName(String val) {
    _fName = val;
    notifyListeners();
  }

  set setLName(String val) {
    _lName = val;
    notifyListeners();
  }

  set setPhone(String val) {
    _phone = val;
    notifyListeners();
  }

  set setPathImage(String val) {
    _pathImage = val;
    notifyListeners();
  }

  set setLocation(String val) {
    _location = val;
    notifyListeners();
  }

  set setWorkdays(String? val) {
    _workdays = val;
    notifyListeners();
  }

  set setHolidays(String? val) {
    _holidays = val;
    notifyListeners();
  }

  set setHoursFrom(String? val) {
    _hourFrom = val;
    notifyListeners();
  }

  set setHoursUntil(String? val) {
    _hoursUntil = val;
    notifyListeners();
  }
}
