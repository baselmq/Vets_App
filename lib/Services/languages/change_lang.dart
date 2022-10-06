import 'package:flutter/material.dart';

import '../../Language/Config/config_lang.dart';

class ChangeLang extends ChangeNotifier {
  Locale _lang = ConfigLanguage.EN_LOCALE;
  int _valueGroup = 1;
  get lang => _lang;
  get valueGroup => _valueGroup;

  set switchLang(Locale value) {
    _lang = value;
    notifyListeners();
  }

  set switchValueGroup(int value) {
    _valueGroup = value;
    notifyListeners();
  }
}
