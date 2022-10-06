import 'dart:math';

String generateIdDoc() {
  String pass = '';
  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  for (var i = 0; i < 20; i++) {
    int indexRandom = Random().nextInt(chars.length);
    pass += chars[indexRandom];
  }
  return pass;
}
