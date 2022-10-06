import '../../../../../util/key_firebase.dart';

class ModelBooking {
  String? id;
  String? userId;
  String? vetId;
  String? userName;
  String? dateBooking;
  String? timeBooking;

  ModelBooking({
    this.id,
    this.userId,
    this.vetId,
    this.dateBooking,
    this.timeBooking,
  });

  ModelBooking.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        id = data[KeyFirebase.id],
        userId = data[KeyFirebase.userId],
        vetId = data[KeyFirebase.vetId],
        dateBooking = data[KeyFirebase.dateBooking],
        timeBooking = data[KeyFirebase.timeBooking];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.id] = id;
    data[KeyFirebase.userId] = userId;
    data[KeyFirebase.vetId] = vetId;
    data[KeyFirebase.dateBooking] = dateBooking;
    data[KeyFirebase.timeBooking] = timeBooking;

    return data;
  }
}
