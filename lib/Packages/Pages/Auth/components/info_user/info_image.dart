import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../Services/Authentication/profile_image.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../util/path_icons.dart';
import '../../../../../util/path_images.dart';
import 'alert_choose.dart';

class InfoImage extends StatelessWidget {
  const InfoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileImage provideImage = Provider.of<ProfileImage>(context);
        ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(1.h),
      // * background
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: AppColors.colorLogo),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // * image
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: AppColors.white,
              ),
              image: DecorationImage(
                image: (provideImage.image == null)
                    ? const AssetImage(PathImage.notFoundUserPng)
                    : FileImage(provideImage.image!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Add Image Icon
          Positioned(
            bottom: 4,
            right: -4,
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                  color: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary)),
              child: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const AlertChooseImage(),
                  );
                },
                icon: PathIcons.camera,
              ),
            ),
          )
        ],
      ),
    );
  }
}
