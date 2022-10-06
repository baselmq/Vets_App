import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Theme/app_colors.dart';

class PathIcons {
  static const String logo = 'assets/icons/logo.svg';

  static const FaIcon clipboardList = FaIcon(
    FontAwesomeIcons.clipboardList,
  );
  static const FaIcon user = FaIcon(
    FontAwesomeIcons.user,
  );
  static const FaIcon userDoctor = FaIcon(
    FontAwesomeIcons.userDoctor,
  );

  static Icon email = Icon(
    Icons.email_outlined,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon password = Icon(
    Icons.lock_outline_rounded,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon visibility = Icon(
    Icons.visibility_outlined,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon visibilityOff = Icon(
    Icons.visibility_off_outlined,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon person = Icon(
    Icons.person_outline_rounded,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon phone = Icon(
    Icons.phone_iphone_rounded,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon location = Icon(
    Icons.location_on_outlined,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon description = Icon(
    Icons.description,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon arrowForward = Icon(
    Icons.arrow_forward_rounded,
    color: AppColors.primary,
    size: 23.w,
  );
  static Icon arrowRight = Icon(
    Icons.arrow_forward_ios_rounded,
    color: AppColors.gray,
    size: 18.w,
  );

  static final FaIcon errorInitFirebase = FaIcon(
    FontAwesomeIcons.exclamation,
    color: AppColors.yellowOrange,
  );
  static final FaIcon logout = FaIcon(
    FontAwesomeIcons.rightFromBracket,
    color: AppColors.yellowOrange,
  );
  static final FaIcon helpCenter = FaIcon(
    FontAwesomeIcons.circleQuestion,
    color: AppColors.yellowOrange,
  );
  static final FaIcon setting = FaIcon(
    FontAwesomeIcons.gear,
    color: AppColors.yellowOrange,
  );
  static final FaIcon camera = FaIcon(
    FontAwesomeIcons.camera,
    color: AppColors.primary,
    size: 18.sp,
  );
  static final FaIcon gallery = FaIcon(
    FontAwesomeIcons.fileImage,
    color: AppColors.primary,
  );
  static final FaIcon trash = FaIcon(
    FontAwesomeIcons.trash,
    color: AppColors.primary,
  );
  static FaIcon paw({Color? color}) => FaIcon(
        FontAwesomeIcons.paw,
        color: color,
        size: 15.w,
      );
  static FaIcon calendarDays({Color? color}) => FaIcon(
        FontAwesomeIcons.calendarDays,
        color: color,
        size: 15.w,
      );
  static FaIcon clock({Color? color}) => FaIcon(
        FontAwesomeIcons.clock,
        color: color,
        size: 15.w,
      );
  static FaIcon stethoscope({Color? color}) => FaIcon(
        FontAwesomeIcons.stethoscope,
        color: color,
        size: 20.w,
      );
  static FaIcon filter = FaIcon(
    FontAwesomeIcons.bars,
    color: AppColors.primary,
    size: 18.w,
  );

  // static FaIcon clock({Color? colors}) => FaIcon(
  //       FontAwesomeIcons.clock,
  //       color:  colors,
  //       size: 15.w,
  //     );

  // static FaIcon email = FaIcon(
  //   FontAwesomeIcons.envelope,
  //   color: AppColors.primary,
  //   size: 20.w,
  // );
  // static FaIcon password = FaIcon(
  //   FontAwesomeIcons.lock,
  //   color: AppColors.primary,
  //   size: 20.w,
  // );
  static IconData c = Icons.file_download;

  static const String arrowRightSvg = 'assets/icons/arrow_right.svg';
  static const String backIcon = 'assets/icons/Back_Icon.svg';
  static const String bell = 'assets/icons/Bell.svg';
  static const String call = 'assets/icons/Call.svg';
  static const String cameraIcon = 'assets/icons/Camera_Icon.svg';
  static const String chatBubbleIcon = 'assets/icons/Chat_bubble_Icon.svg';
  static const String checkMarkRounded = 'assets/icons/Check_mark_rounded.svg';
  static const String close = 'assets/icons/Close.svg';
  static const String error = 'assets/icons/Error.svg';
  static const String heartIcon = 'assets/icons/Heart_Icon.svg';
  static const String heartIcon2 = 'assets/icons/Heart_Icon2.svg';
  static const String locationPoint = 'assets/icons/Location_point.svg';
  static const String lock = 'assets/icons/Lock.svg';
  static const String logOut = 'assets/icons/Log_out.svg';
  static const String mail = 'assets/icons/Mail.svg';
  static const String phoneSvg = 'assets/icons/Phone.svg';
  static const String questionMark = 'assets/icons/Question_mark.svg';
  static const String searchIcon = 'assets/icons/Search_Icon.svg';
  static const String settings = 'assets/icons/Settings.svg';
  static const String starIcon = 'assets/icons/Star_Icon.svg';
  static const String userIcon = 'assets/icons/User_Icon.svg';
  static const String userSvg = 'assets/icons/User.svg';
  static const String date = 'assets/icons/date.svg';
  static const String add = 'assets/icons/Plus_Icon.svg';
  static const String facebook = 'assets/icons/facebook.svg';
  static const String google = 'assets/icons/google.svg';
  static const String twitter = 'assets/icons/twitter.svg';
}
