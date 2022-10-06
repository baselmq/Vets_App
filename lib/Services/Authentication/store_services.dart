import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_user.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_vet.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_booking.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_rating.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_waiting_booking.dart';
import 'package:vets_app/Packages/Pages/User/models/model_favorite.dart';

import '../../util/key_firebase.dart';

class StoreServices extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  // String _nameVet = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  // String get nameVet => _nameVet;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set setMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  // set setNameVet(String name) {
  //   _nameVet = name;
  //   notifyListeners();
  // }

  // * Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final CollectionReference _collectionBooking =
      FirebaseFirestore.instance.collection(KeyFirebase.colBooking);
  final CollectionReference _collectionBookingUser =
      FirebaseFirestore.instance.collection(KeyFirebase.colBookingUser);
  final CollectionReference _collectionUser =
      FirebaseFirestore.instance.collection(KeyFirebase.colUser);
  final CollectionReference _collectionVet =
      FirebaseFirestore.instance.collection(KeyFirebase.colVet);
  final CollectionReference _collectionRating =
      FirebaseFirestore.instance.collection(KeyFirebase.colRating);
  final CollectionReference _collectionFavorite =
      FirebaseFirestore.instance.collection(KeyFirebase.colFavorite);

  // * get Data User
  User get userData => firebaseAuth.currentUser!;
// * get Vet Booking Data
  Stream getVetDetails(
    String? id,
  ) =>
      _collectionVet.doc(id).snapshots().map((snapshot) =>
          ModelVet.fromMap(snapshot.data() as Map<String, dynamic>));

  // * get User Booking Data
  Stream getUserDetails(
    String? id,
  ) =>
      _collectionUser.doc(id).snapshots().map((snapshot) =>
          ModelUser.fromMap(snapshot.data() as Map<String, dynamic>));

  Stream getBookingUser(
    String? id,
  ) =>
      _collectionBookingUser.doc(id).snapshots().map((snapshot) =>
          ModelBooking.fromMap(snapshot.data() as Map<String, dynamic>));

// * --------------------  Booking ----------------------
  // * add Bookings
  Future<bool> addCollectionWaiting(
      {required ModelWaitingList waitingList, required String vetName}) async {
    setLoading = true;
    String? userId = waitingList.userId;
    String? vetId = waitingList.vetId;
    try {
      await _collectionBooking
          .doc(vetId)
          .set({KeyFirebase.nameVet: vetName}).then((value) {
        _collectionBooking
            .doc(vetId)
            .collection(KeyFirebase.colWaitingList)
            .doc(userId)
            .set(waitingList.toMap());
      });
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

  Future<bool> addCollectionBookings(
      {required ModelBooking modelBooking, required String collection}) async {
    setLoading = true;
    String? userId = modelBooking.userId;
    String? vetId = modelBooking.vetId;
    try {
      await _collectionBooking
          .doc(vetId)
          .collection(collection)
          .doc(userId)
          .set(modelBooking.toMap());
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

  Future<bool> addCollectionBookingsUser(
      {required ModelBooking modelBooking}) async {
    setLoading = true;
    String? userId = modelBooking.userId;
    try {
      await _collectionBookingUser.doc(userId).set(modelBooking.toMap());
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

  // * add Rating
  Future<bool> addRating({required ModelRating modelRating}) async {
    try {
      await _collectionRating.doc().set(modelRating.toMap());
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

  // * add Favorite
  Future<bool> addFavorite({required ModelFavorite modelFavorite}) async {
    try {
      await _collectionFavorite.doc().set(modelFavorite.toMap());
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

  // // * add booking
  // Future<bool> addBooking({required ModelBooking modelBooking}) async {
  //   try {
  //     String? vetId = modelBooking.vetId;
  //     await _collectionVet.add({'Name Vet': ''});
  //     return true;
  //   } catch (e) {
  //     setMessage = e.toString();
  //     return false;
  //   }
  // }

  // * get Waiting List Booking
  Stream<List<ModelBooking>> getListBookingsForVet(String vetId) =>
      _collectionBooking
          .doc(vetId)
          .collection(KeyFirebase.colWaitingList)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ModelBooking.fromMap(doc.data()))
              .toList());

  // * get Current List Booking
  Stream<List<ModelBooking>> getCurrentListBookings(String vetId) =>
      _collectionBooking
          .doc(vetId)
          .collection(KeyFirebase.colCurrentList)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => ModelBooking.fromMap(doc.data()))
              .toList());

  // * delete Booking
  deleteWaitingList({required String idVet, required String idUser}) {
    final booking = _collectionBooking
        .doc(idVet)
        .collection(KeyFirebase.colWaitingList)
        .doc(idUser);
    booking.delete();
  }

  // * get List Rating
  Stream<List<ModelRating>> getListRatings() =>
      _collectionRating.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => ModelRating.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

  // * get List Rating
  Stream<List<ModelFavorite>> getListFavorite() =>
      _collectionFavorite.snapshots().map((snapshot) => snapshot.docs
          .map((doc) =>
              ModelFavorite.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

// * get Vet Data
  Stream getVet(String id) => _collectionVet.doc(id).snapshots().map(
      (snapshot) => ModelVet.fromMap(snapshot.data() as Map<String, dynamic>));

// * get List Vets
  // * get User Booking Data
  // var streamColBooking =
  //     FirebaseFirestore.instance.collection(KeyFirebase.colBooking).snapshots();

  // * get List Booking
  // Stream<List<ModelBooking>> getListBookingsForUser() => _collectionBooking
  //     .doc()
  //     .collection(KeyFirebase.colWaitingList)
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs
  //         .map((doc) => ModelBooking.fromMap(doc.data()))
  //         .toList());
}
