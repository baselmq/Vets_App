import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:easy_localization/easy_localization.dart';

class SplitDays {
  // * Split Days
  static List splitWorkday = [];
  static List splitHolidays = [];

  static void workday(String sentence, String pattern) {
    String s = '';
    for (int i = 0; i < sentence.length; i++) {
      if (sentence[i] != pattern) {
        s += sentence[i];
      } else {
        splitWorkday.add(translateDay(s));
        s = '';
      }
    }
    splitWorkday.add(s);
  }

  static void holidays(String sentence, String pattern) {
    String s = '';
    for (int i = 0; i < sentence.length; i++) {
      if (sentence[i] != pattern) {
        s += sentence[i];
      } else {
        splitHolidays.add(translateDay(s));
        s = '';
      }
    }
    splitHolidays.add(s);
  }

  static String translateDay(String day) {
    switch (day) {
      case 'Sat':
        return KeyLang.sat.tr();

      case 'Sun':
        return KeyLang.sun.tr();

      case 'Mon':
        return KeyLang.mon.tr();

      case 'Tue':
        return KeyLang.tue.tr();

      case 'Wed':
        return KeyLang.wed.tr();

      case 'Thu':
        return KeyLang.thu.tr();

      case 'Fri':
        return KeyLang.fri.tr();
      default:
        return KeyLang.thereAreNoDays.tr();
    }
  }
}
