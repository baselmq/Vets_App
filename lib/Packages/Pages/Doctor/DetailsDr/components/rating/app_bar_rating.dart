import 'package:flutter/material.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import '../../../../../../Theme/app_colors.dart';
import '../../../../../../Theme/theme_status.dart';
import '../../../../../Components/Clipper/custom_clip_path.dart';
import '../../../../../Components/cache_image/image_user.dart';
import '../../../../../Components/container_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../Auth/models/model_vet.dart';

class AppBarRating extends StatelessWidget implements PreferredSizeWidget {
  const AppBarRating({required ModelVet vet, super.key}) : _vet = vet;
  final ModelVet _vet;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(width: 0),
      flexibleSpace: ClipPath(
        clipper: MyCustomClipper(),
        child: BackgroundContainer(
          height: 150.h,
          child: SafeArea(
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 35.w),
                  ImageUser(
                    imageUrl: _vet.image!,
                  ),
                ],
              ),
              title: Row(
                children: [
                  Text('${_vet.firstName} ${_vet.lastName}',
                      style: AppTheme.titleMedium(context: context)
                          ?.copyWith(color: AppColors.white)),
                  SizedBox(width: 10.w),
                  Text('4.2',
                      style: AppTheme.bodyMedium(context: context)
                          ?.copyWith(color: AppColors.bgColor)),
                ],
              ),
              subtitle: Text(KeyLang.ratingAndReviews.tr(),
                  style: AppTheme.bodyMedium(context: context)
                      ?.copyWith(color: AppColors.bgColor)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
