import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../Theme/theme_status.dart';

// ? Page Appointments
class CardNoConsultation extends StatelessWidget {
  const CardNoConsultation({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            KeyLang.upcomingConsultation.tr(),
            style: AppTheme.titleSmall(context: context),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            PathImage.notFoundUserPng,
                            width: 50,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            KeyLang.noConsultationComing.tr(),
                            style: AppTheme.bodyMedium(context: context),
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
