import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Components/navigation_custom.dart';
import 'package:vets_app/Packages/Pages/profile/view/profile.dart';

import 'Appointments/view/appointments.dart';
import 'Home/view/home_doctor.dart';

class BodyDr extends StatefulWidget {
  const BodyDr({super.key});
  static const String id = 'BodyDr';

  @override
  State<BodyDr> createState() => _BodyDrState();
}

class _BodyDrState extends State<BodyDr> {
  int _indexPage = 0;
  final List _pages = [
    const PageDrHome(),
    const PageAppointments(),
    const PageProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_indexPage],
      bottomNavigationBar: CustomNavigationBar(
        indexPage: _indexPage,
        onPress: (value) {
          setState(() {
            _indexPage = value;
          });
        },
      ),
    );
  }
}
