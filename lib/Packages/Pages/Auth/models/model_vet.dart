import '../../../../util/key_firebase.dart';

class ModelVet {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? location;
  String? description;
  String? type;
  String? image;
  String? email;
  String? workdays;
  String? holidays;
  String? hourFrom;
  String? hoursUntil;
  bool? available;

  ModelVet(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.location,
      this.description,
      this.type,
      this.image,
      this.email,
      this.workdays,
      this.holidays,
      this.hourFrom,
      this.hoursUntil,
      this.available});

  ModelVet.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        id = data[KeyFirebase.id],
        email = data[KeyFirebase.email],
        firstName = data[KeyFirebase.firstName],
        lastName = data[KeyFirebase.lastName],
        location = data[KeyFirebase.location],
        description = data[KeyFirebase.description],
        image = data[KeyFirebase.userImage],
        type = data[KeyFirebase.userType],
        workdays = data[KeyFirebase.workdays],
        holidays = data[KeyFirebase.holidays],
        hourFrom = data[KeyFirebase.hourFrom],
        hoursUntil = data[KeyFirebase.hoursUntil],
        available = data[KeyFirebase.available],
        phone = data[KeyFirebase.userPhone];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.id] = id;
    data[KeyFirebase.email] = email;
    data[KeyFirebase.firstName] = firstName;
    data[KeyFirebase.lastName] = lastName;
    data[KeyFirebase.location] = location;
    data[KeyFirebase.description] = description;
    data[KeyFirebase.userImage] = image;
    data[KeyFirebase.userType] = type;
    data[KeyFirebase.workdays] = workdays;
    data[KeyFirebase.holidays] = holidays;
    data[KeyFirebase.hourFrom] = hourFrom;
    data[KeyFirebase.hoursUntil] = hoursUntil;
    data[KeyFirebase.available] = available;
    data[KeyFirebase.userPhone] = phone;
    return data;
  }
}
