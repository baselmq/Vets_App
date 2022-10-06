import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Pages/User/ChoiceDoctor/view/doctor_choice.dart';
import 'package:vets_app/Packages/Pages/User/Home/view/home_user.dart';
import 'package:vets_app/Packages/Pages/profile/view/profile.dart';

import '../../Components/navigation_custom.dart';

class BodyUser extends StatefulWidget {
  const BodyUser({super.key});
  static const String id = 'BodyUser';

  @override
  State<BodyUser> createState() => _BodyUserState();
}

class _BodyUserState extends State<BodyUser> {
  int _indexPage = 0;
  final List _pages = [
    const PageHomeUser(),
    // const PageDrDetails(),
    const PageDoctorChoice(),

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
