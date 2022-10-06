import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../../../../../Services/Authentication/send_data_vet.dart';

class SelectWeekday extends StatefulWidget {
  const SelectWeekday({super.key});

  @override
  State<SelectWeekday> createState() => _SelectWeekdayState();
}

class _SelectWeekdayState extends State<SelectWeekday> {
  final values = List.filled(7, false);
  List<String> dayWeek = [];
  final notSelectDays = <String>[];

  int? lastTapped;
  // printIntAsDay(int day) {
  //   print(
  //       'Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}');
  // }

  String intDayToEnglish(int day) {
    if (day % 7 == DateTime.saturday % 7) return 'Sat';
    if (day % 7 == DateTime.sunday % 7) return 'Sun';
    if (day % 7 == DateTime.monday % 7) return 'Mon';
    if (day % 7 == DateTime.tuesday % 7) return 'Tue';
    if (day % 7 == DateTime.wednesday % 7) return 'Wed';
    if (day % 7 == DateTime.thursday % 7) return 'Thu';
    if (day % 7 == DateTime.friday % 7) return 'Fri';
    throw '🐞 This should never have happened: $day';
  }
  // String intDayToEnglish(int day) {
  //   if (day % 7 == DateTime.saturday % 7) return 'Saturday';
  //   if (day % 7 == DateTime.sunday % 7) return 'Sunday';
  //   if (day % 7 == DateTime.monday % 7) return 'Monday';
  //   if (day % 7 == DateTime.tuesday % 7) return 'Tuesday';
  //   if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
  //   if (day % 7 == DateTime.thursday % 7) return 'Thursday';
  //   if (day % 7 == DateTime.friday % 7) return 'Friday';
  //   throw '🐞 This should never have happened: $day';
  // }

  String? selectDay(List<bool?> values, bool? searchedValue) {
    final days = <String>[];
    for (int i = 0; i < values.length; i++) {
      final v = values[i];
      // Use v == true, as the value could be null, as well (disabled days).
      if (v == searchedValue) days.add(intDayToEnglish(i));
    }
    if (days.isEmpty) return null;

    return days.join(', ');
  }

  String? notSelectDay(List<bool?> values, bool? searchedValue) {
    final notSelectDays = <String>[];
    for (int i = 0; i < values.length; i++) {
      final v = values[i];
      // Use v == true, as the value could be null, as well (disabled days).
      if (v == searchedValue) notSelectDays.add(intDayToEnglish(i));
    }
    if (notSelectDays.isEmpty) return null;

    return notSelectDays.join(', ');
  }

  checkWeekday(value) {}
  @override
  Widget build(BuildContext context) {
    final VetData vetData = Provider.of<VetData>(context);

    // return WeekdaySelector(
    //   firstDayOfWeek: DateTime.sunday,
    //   onChanged: (int day) {
    //     setState(() {
    //       final index = day % 7;
    //       values[index] = !values[index];
    //       print(values[index]);
    //     });
    //   },
    //   values: values,
    // );
    return WeekdaySelector(
        selectedFillColor: AppColors.primary,
        selectedColor: AppColors.white,
        firstDayOfWeek: DateTime.sunday,

        // We display the last tapped value in the example app
        onChanged: (value) {
          final index = value % 7;

          values[index] = !values[index];
          vetData.setWorkdays = selectDay(values, true);
          vetData.setHolidays = notSelectDay(values, false);

          // printIntAsDay(value);
          setState(() => lastTapped = value);
        },
        values: values);
  }
}
