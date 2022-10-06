import 'package:intl/intl.dart';

String formatDate(String selectedDate, String pattern) {
  DateFormat format = DateFormat(pattern);

  String formatted = format.format(DateTime.parse(selectedDate));
  return formatted;
}

String changePatternDate(String selectedDate, String pattern) {
  DateFormat format = DateFormat(pattern);

  String formatted = format.format(DateTime.parse(selectedDate));
  return formatted;
}
