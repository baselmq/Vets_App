import 'package:flutter/material.dart';
import '../../util/path_icons.dart';

class ProviderConfirmPass with ChangeNotifier {
  Icon iconSuffixConfirm = PathIcons.visibilityOff;
  bool isObscureConfirm = true;

  //* Show Password
  viewConfirmPass() {
    if (isObscureConfirm) {
      iconSuffixConfirm = PathIcons.visibility;
      isObscureConfirm = false;
    } else {
      iconSuffixConfirm = PathIcons.visibilityOff;
      isObscureConfirm = true;
    }
    notifyListeners();
  }
}
