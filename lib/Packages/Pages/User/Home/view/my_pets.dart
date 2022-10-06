import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Pages/User/Home/components/card_my_pets.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../../util/path_images.dart';

class MyPets extends StatelessWidget {
  const MyPets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
           KeyLang.myPets.tr(),
            style: AppTheme.bodyMedium(context: context)
                ?.copyWith(color: AppColors.gray),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 88.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(width: 10.w),
                  Padding(
                    padding: index == 2 - 1
                        ? EdgeInsets.only(right: 10.w)
                        : const EdgeInsets.only(right: 0),
                    child: const CardMyPets(
                      imageUrl: PathImage.circleImage,
                      name: 'Chamberlain',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
