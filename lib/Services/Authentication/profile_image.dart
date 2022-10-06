import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProfileImage extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  File? _image;

  // * get loading
  bool get isLoading => _isLoading;
  // * get message
  String get errorMessage => _errorMessage;
  // * get image
  File? get image => _image;

  // * change loading
  set setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // * set Message
  set setMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  // * set image
  set setImage(File? image) {
    _image = image;
    notifyListeners();
  }

  Future<String> uploadImage({
    required String directory,
    required File image,
  }) async {
    try {
      setLoading = true;
      Reference ref = FirebaseStorage.instance.ref(directory);
      UploadTask upload = ref.putFile(image);
      TaskSnapshot snapshot = await upload.whenComplete(() => {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return '';
    }
  }
}
