import 'package:flutter/material.dart';
import '../../util/path_icons.dart';

class ProviderShowPass with ChangeNotifier {
  Icon iconSuffix = PathIcons.visibilityOff;
  bool isObscure = true;
  String register = 'register';
  //* Show Password
  viewPass() {
    if (isObscure) {
      iconSuffix = PathIcons.visibility;
      isObscure = false;
    } else {
      iconSuffix = PathIcons.visibilityOff;
      isObscure = true;
    }
    notifyListeners();
  }
}
