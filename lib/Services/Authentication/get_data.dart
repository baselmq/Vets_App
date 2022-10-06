import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_user.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_booking.dart';

import '../../Packages/Pages/Auth/models/model_vet.dart';

class GetData extends ChangeNotifier {
  ModelVet? _modelVet;
  ModelUser? _modelUser;
  ModelBooking? _modelBooking;
  String? _idVet;
  String? _idUser;
  // ModelWaitingBooking? _modelWaitingBooking;

  ModelVet? get modelVet => _modelVet;
  ModelUser? get modelUser => _modelUser;
  ModelBooking? get modelBooking => _modelBooking;
  String? get idVet => _idVet;
  String? get idUser => _idUser;
  // ModelWaitingBooking? get modelWaitingBooking => _modelWaitingBooking;

  set setModelVet(ModelVet val) {
    _modelVet = val;
  }

  set setModelUser(ModelUser val) {
    _modelUser = val;
  }

  set setModelBooking(ModelBooking val) {
    _modelBooking = val;
  }

  set setIdVet(String id) {
    _idVet = id;
  }

  set setIdUser(String id) {
    _idUser = id;
  }

  // set setModelWaitingBooking(ModelWaitingBooking val) {
  //   _modelWaitingBooking = val;
  // }

  // @override
  // notifyListeners();
}
