import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';
import 'package:vets_app/Services/Authentication/get_data.dart';
import '../../../../Services/Theme/change_theme.dart';
import '../../../../Theme/app_colors.dart';
import '../../../../Theme/theme_status.dart';
import '../../../../util/path_icons.dart';
import '../../../Components/cache_image/image_user.dart';
import '../../../Components/container_background.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetData data = Provider.of<GetData>(context, listen: false);
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Stack(
      children: [
        ClipPath(
          clipper: MyCustomClipper(),
          child: BackgroundContainer(
            height: 280.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ImageUser(
                      imageUrl:
                          AuthServices().userData.uid == data.modelUser?.id
                              ? '${data.modelUser!.image}'
                              : '${data.modelVet!.image}',
                      radius: 50,
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: themes.isDark
                                ? AppColors.darkWidget
                                : AppColors.bgColor,
                            shape: const CircleBorder(),
                            side: BorderSide(
                                color: themes.isDark
                                    ? AppColors.darkWidget
                                    : AppColors.bgColor),
                            // padding: EdgeInsets.all(13.w),
                          ),
                          child: PathIcons.camera),
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  AuthServices().userData.uid == data.modelUser?.id
                      ? '${data.modelUser!.firstName} ${data.modelUser!.lastName}'
                      : '${data.modelVet!.firstName} ${data.modelVet!.lastName}',
                  style: AppTheme.titleMedium(context: context)
                      ?.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 5.h),
                Text(
                  AuthServices().userData.uid == data.modelUser?.id
                      ? '${data.modelUser!.email}'
                      : '${data.modelVet!.email}',
                  style: AppTheme.bodySmall(context: context)
                      ?.copyWith(color: AppColors.yellowOrange),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
