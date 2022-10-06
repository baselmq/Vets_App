import 'package:flutter/material.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/util/key_firebase.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../../util/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class NoAppointments extends StatelessWidget {
  const NoAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
          child: Image.asset(PathImage.noAppointment),
        ),
        Text(
          KeyLang.noAppointments.tr(),
          style:
              AppTheme.bodyLarge(context: context)?.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }
}
