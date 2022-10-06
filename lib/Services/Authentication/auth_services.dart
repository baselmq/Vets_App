import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_vet.dart';

import '../../Packages/Pages/Auth/models/model_user.dart';
import '../../util/key_firebase.dart';

class AuthServices extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set setMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  // * Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final CollectionReference _collectionUser =
      FirebaseFirestore.instance.collection(KeyFirebase.colUser);
  final CollectionReference _collectionVet =
      FirebaseFirestore.instance.collection(KeyFirebase.colVet);

  // * register
  Future<User?> register(
      {required String email, required String password}) async {
    try {
      setLoading = true;
      UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      late User user;
      if (authResult.user?.uid.isNotEmpty ?? false) {
        user = authResult.user!;
        setLoading = false;
      }
      return user;
    } on SocketException {
      setLoading = false;
      setMessage = 'No internet, Please connect to internet';
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
    }
    return null;
  }

  // * login
  Future<User?> login({required String email, required String password}) async {
    try {
      setLoading = true;
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      late User user;
      if (authResult.user?.uid.isNotEmpty ?? false) {
        user = authResult.user!;
        setLoading = false;
      }
      return user;
    } on SocketException {
      setLoading = false;
      setMessage = 'No internet, Please connect to internet';
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
    }
    return null;
  }

  // * reset password
  Future<bool> resetPassword({required String email}) async {
    try {
      setLoading = true;
      await firebaseAuth.sendPasswordResetEmail(email: email);
      setLoading = false;
      return true;
    } on SocketException {
      setLoading = false;
      setMessage = 'No internet, Please connect to internet';
      return false;
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
      return false;
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return false;
    }
  }

  // * signOut
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // * get  user
  Stream<User> get user => firebaseAuth.authStateChanges().map((user) => user!);

  // * get Data User
  User get userData => firebaseAuth.currentUser!;

  // * add info user
  Future<bool> addInfoUser({required ModelUser modelUser}) async {
    try {
      modelUser.id = userData.uid;
      modelUser.email = userData.email;
      await _collectionUser.doc(modelUser.id).set(modelUser.toMap());
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

// ? --------------------------------------------------------------------

  Future<ModelVet?> getDataVet() async {
    final docVet = _collectionVet.doc(userData.uid);
    final snapshot = await docVet.get();

    if (snapshot.exists) {
      return ModelVet.fromMap(snapshot.data() as Map<String, dynamic>);
    }
    return null;
  }

// ? --------------------------------------------------------------------

// ! --------------------------------------------------------------------
// * get Vet Data
  Stream getDocumentVet() => _collectionVet.doc(userData.uid).snapshots().map(
      (snapshot) => ModelVet.fromMap(snapshot.data() as Map<String, dynamic>));
// * get User Data
  Stream getDocumentUser() => _collectionUser.doc(userData.uid).snapshots().map(
      (snapshot) => ModelUser.fromMap(snapshot.data() as Map<String, dynamic>));
// * get List Vets
  Stream<List<ModelVet>> getAllVets() =>
      _collectionVet.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => ModelVet.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

// ! --------------------------------------------------------------------

  // * add info Vet
  Future<bool> addInfoVet({required ModelVet modelVet}) async {
    try {
      modelVet.id = userData.uid;
      modelVet.email = userData.email;
      await _collectionVet.doc(modelVet.id).set(modelVet.toMap());
      return true;
    } catch (e) {
      setMessage = e.toString();
      return false;
    }
  }

  // * readDataVet

  Future<ModelUser?> readVet() async {
    final docVet =
        FirebaseFirestore.instance.collection('user').doc(userData.uid);
    final snapshot = await docVet.get();

    if (snapshot.exists) {
      return ModelUser.fromMap(snapshot.data()!);
    }
    return null;
  }
}
