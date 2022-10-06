import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Theme/app_colors.dart';

class CustomTheme {
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(primary: AppColors.primary),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
        ),
      ),

      /// displayColor ~>  headline4, headline3, headline2, headline1, and caption
      /// bodyColor  ~> is applied to the remaining text styles.
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
            // decorationColor: Colors.black,
            fontFamily: GoogleFonts.aBeeZee().fontFamily,
          ),
      // textTheme: Theme.of(context).textTheme.copyWith(
      //       titleLarge: TextStyle(
      //           color: Colors.black,
      //           fontFamily: GoogleFonts.aBeeZee().fontFamily),
      //       bodyLarge: TextStyle(
      //           color: Colors.white,
      //           fontFamily: GoogleFonts.aBeeZee().fontFamily),
      //       bodyMedium: TextStyle(
      //           color: Colors.white,
      //           fontFamily: GoogleFonts.aBeeZee().fontFamily),
      //       bodySmall: TextStyle(
      //           color: Colors.white,
      //           fontFamily: GoogleFonts.aBeeZee().fontFamily),
      //     ),
    );
  }

  // * * * * * * * * * * * * *** Dark *** * * * * * * * * * * * *
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(primary: AppColors.primary),
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
            fontFamily: GoogleFonts.aBeeZee().fontFamily,
          ),
    );
  }
}
