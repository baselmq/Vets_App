// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../../../../Services/Authentication/store_services.dart';
// import '../../../../../util/key_firebase.dart';

// class FlitterListBookings extends StatefulWidget {
//   const FlitterListBookings({super.key, required this.selectedDate});
//   final DateTime selectedDate;
//   @override
//   State<FlitterListBookings> createState() => _FlitterListBookingsState();
// }

// class _FlitterListBookingsState extends State<FlitterListBookings> {
  // flitterData() async {
  //   await FirebaseFirestore.instance
  //       .collection(KeyFirebase.colBooking)
  //       .doc(StoreServices().userData.uid)
  //       .collection(KeyFirebase.colCurrentList)
  //       .where(KeyFirebase.dateBooking,
  //           isEqualTo: widget.selectedDate.toString())
  //       .get()
  //       .then((value) => value.docs.forEach((element) {
  //             element.data()[KeyFirebase.timeBooking];
  //             print(
  //                 '======================================== ${element.data()[KeyFirebase.dateBooking]}');
  //             print('================= ${widget.selectedDate}');
  //           }));
  // }

//   @override
//   void initState() {
//     flitterData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
