import '../../../../../util/key_firebase.dart';

class ModelFavorite {
  String? userId;
  String? vetId;
  String? favorite;

  ModelFavorite({
    this.userId,
    this.vetId,
    this.favorite,
  });

  ModelFavorite.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        userId = data[KeyFirebase.userId],
        vetId = data[KeyFirebase.vetId],
        favorite = data[KeyFirebase.favorite];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.userId] = userId;
    data[KeyFirebase.vetId] = vetId;
    data[KeyFirebase.favorite] = favorite;

    return data;
  }
}
