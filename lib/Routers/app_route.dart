import 'package:flutter/material.dart';

import '../Packages/Pages/Auth/views/doctorPages/complete_vet.dart';
import '../Packages/Pages/Auth/views/doctorPages/info_vet.dart';
import '../Packages/Pages/Auth/views/forgot.dart';
import '../Packages/Pages/Auth/views/info.dart';
import '../Packages/Pages/Auth/views/login.dart';
import '../Packages/Pages/Auth/views/register.dart';
import '../Packages/Pages/Auth/views/wrapper.dart';
import '../Packages/Pages/ControllerApp/body.dart';
import '../Packages/Pages/Auth/views/wrapper_data.dart';
import '../Packages/Pages/Splash/splash_page.dart';
import '../Packages/Pages/User/ChoiceDoctor/view/doctor_choice.dart';
import '../Packages/Pages/User/body.dart';
import '../Packages/Pages/User/Home/view/home_user.dart';
import '../Packages/Pages/Doctor/body.dart';

class AppRoute {
  static Map<String, WidgetBuilder> route = {
    PageSplash.id: (context) => const PageSplash(),
    BodyDr.id: (context) => const BodyDr(),
    PageLogin.id: (context) => const PageLogin(),
    PageRegister.id: (context) => const PageRegister(),
    PageForgot.id: (context) => const PageForgot(),
    PageInfoUser.id: (context) => const PageInfoUser(),
    PageInfoVet.id: (context) => PageInfoVet(),
    // PageLoginDoctor.id: (context) => const PageLoginDoctor(),
    CompleteProfileVet.id: (context) => const CompleteProfileVet(),
    PageHomeUser.id: (context) => const PageHomeUser(),
    BodyUser.id: (context) => const BodyUser(),
    PageControllerApp.id: (context) => const PageControllerApp(),
    Wrapper.id: (context) => const Wrapper(),
    WrapperData.id: (context) => const WrapperData(),
    PageDoctorChoice.id: (context) => const PageDoctorChoice(),
    // RateVet.id: (context) => const RateVet(),
  };
}
