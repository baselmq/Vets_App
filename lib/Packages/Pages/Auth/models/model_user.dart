import '../../../../util/key_firebase.dart';

class ModelUser {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? type;
  String? image;
  String? email;

  ModelUser({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.type,
    this.image,
    this.email,
  });

  ModelUser.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        id = data[KeyFirebase.id],
        email = data[KeyFirebase.email],
        firstName = data[KeyFirebase.firstName],
        lastName = data[KeyFirebase.lastName],
        image = data[KeyFirebase.userImage],
        type = data[KeyFirebase.userType],
        phone = data[KeyFirebase.userPhone];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.id] = id;
    data[KeyFirebase.email] = email;
    data[KeyFirebase.firstName] = firstName;
    data[KeyFirebase.lastName] = lastName;
    data[KeyFirebase.userImage] = image;
    data[KeyFirebase.userType] = type;
    data[KeyFirebase.userPhone] = phone;
    return data;
  }
}
