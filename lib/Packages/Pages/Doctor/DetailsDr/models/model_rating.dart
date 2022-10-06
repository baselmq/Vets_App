import '../../../../../util/key_firebase.dart';

class ModelRating {
  String? userId;
  String? vetId;
  String? nameUser;
  String? imageUser;
  String? describeExperience;
  String? dateRating;
  double? rating;

  ModelRating({
    this.userId,
    this.vetId,
    this.nameUser,
    this.imageUser,
    this.describeExperience,
    this.dateRating,
    this.rating,
  });

  ModelRating.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        userId = data[KeyFirebase.userId],
        vetId = data[KeyFirebase.vetId],
        nameUser = data[KeyFirebase.nameUser],
        imageUser = data[KeyFirebase.imageUser],
        dateRating = data[KeyFirebase.dateRating],
        rating = data[KeyFirebase.rating],
        describeExperience = data[KeyFirebase.describeExperience];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.userId] = userId;
    data[KeyFirebase.vetId] = vetId;
    data[KeyFirebase.nameUser] = nameUser;
    data[KeyFirebase.imageUser] = imageUser;
    data[KeyFirebase.dateRating] = dateRating;
    data[KeyFirebase.rating] = rating;
    data[KeyFirebase.describeExperience] = describeExperience;

    return data;
  }
}
