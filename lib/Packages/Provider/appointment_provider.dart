import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  List appointmentList = [];
  DateTime _selectedDate = DateTime.now();
  DateTime? get selectedDate => _selectedDate;

  set setSelectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }
}
