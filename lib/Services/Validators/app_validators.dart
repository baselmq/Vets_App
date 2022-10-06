import 'package:validators/validators.dart' as validators;

class AppValidators {
  // * message
  static const _messageEnterValue = 'Please enter a value';
  static const _messageCorrectEmail =
      'Please write an email address by way correct';
  static const _messageCorrectPass =
      'Password must not be less than 8 characters';
  static const _messageCorrectConfirmPass =
      'Password and confirm password do not match';
  static const _messageCorrectPhoneNumber =
      'phone number must be valid and content 10 digits';

  // * email
  static String? isEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isEmail(value!)) {
      return _messageCorrectEmail;
    }
    return null;
  }

  // * pass
  static String? isPassword(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(value!, 8)) {
      return _messageCorrectPass;
    }
    return null;
  }

  // * equal pass
  static String? isEqualPassword(String? value, String pass) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.equals(value, pass)) {
      return _messageCorrectConfirmPass;
    }
    return null;
  }

  // * enter value
  static String? isEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    }
    return null;
  }

  // * phone number
  static String? isPhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(value!.trim(), 10, 10)) {
      return _messageCorrectPhoneNumber;
    }
    return null;
  }
}
