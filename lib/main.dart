import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Pages/Doctor/Home/view/change_current_booking.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';
import 'package:vets_app/Services/Authentication/profile_image.dart';
import 'package:vets_app/Services/Authentication/send_data_vet.dart';
import 'package:vets_app/Services/Theme/change_theme.dart';

import 'Language/Config/config_lang.dart';
import 'Packages/Components/Error/error_init_firebase.dart';
import 'Packages/Pages/Splash/splash_page.dart';
import 'Packages/Provider/appointment_provider.dart';
import 'Routers/app_route.dart';
import 'Services/Authentication/get_data.dart';
import 'Services/Authentication/store_services.dart';
import 'Services/Firestore/booking_data.dart';
import 'Services/languages/change_lang.dart';
import 'Theme/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        ConfigLanguage.AR_LOCALE,
        ConfigLanguage.EN_LOCALE
      ],
      path: ConfigLanguage.LANG_PATH,
      fallbackLocale: ConfigLanguage.EN_LOCALE,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // !
    final Future<FirebaseApp> initFirebase = Firebase.initializeApp();
    // !
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => AuthServices()),
    //   ],
    //   child: ScreenUtilInit(
    //     designSize: const Size(360, 690),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (BuildContext context, Widget? child) {
    //       return MaterialApp(
    //         title: 'Flutter Demo',
    //         debugShowCheckedModeBanner: false,
    //         theme: CustomTheme.lightTheme(context),
    //         darkTheme: CustomTheme.darkTheme(context),
    //         themeMode: ThemeMode.light,
    //         initialRoute: PageSplash.id,
    //         routes: AppRoute.route,
    //       );
    //     },
    //   ),.

    // );
    return FutureBuilder(
      future: initFirebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorInitFirebase();
        } else if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AuthServices()),
              ChangeNotifierProvider(create: (context) => ProfileImage()),
              ChangeNotifierProvider(create: (context) => VetData()),
              ChangeNotifierProvider(create: (context) => GetData()),
              ChangeNotifierProvider(create: (context) => StoreServices()),
              ChangeNotifierProvider(create: (context) => DataBooking()),
              ChangeNotifierProvider(create: (context) => ChangeIndex()),
              ChangeNotifierProvider(create: (context) => ChangeThemes()),
              ChangeNotifierProvider(create: (context) => ChangeLang()),
              ChangeNotifierProvider(
                  create: (context) => AppointmentProvider()),
            ],
            child: Builder(
              builder: (BuildContext context) {
                ChangeThemes theme = Provider.of<ChangeThemes>(context);

                return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (BuildContext context, Widget? child) {
                    return MaterialApp(
                      title: 'Flutter Demo',
                      debugShowCheckedModeBanner: false,
                      theme: CustomTheme.lightTheme(context),
                      darkTheme: CustomTheme.darkTheme(context),
                      themeMode: theme.themeChoose,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      initialRoute: PageSplash.id,
                      routes: AppRoute.route,
                    );
                  },
                );
              },
            ),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SizedBox(child: Center(child: Text('Loading'))),
            ),
          );
        }
      },
    );
  }
}
