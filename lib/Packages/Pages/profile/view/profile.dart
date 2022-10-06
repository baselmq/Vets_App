import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Pages/Auth/views/login.dart';
import 'package:vets_app/Packages/Pages/profile/components/card_profile.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../Services/Authentication/auth_services.dart';
import '../../../../Services/Theme/change_theme.dart';
import '../components/alert_dialog.dart';
import '../components/header.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context);

    return Scaffold(
      backgroundColor: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderProfile(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  CardProfile(
                    title: KeyLang.myAccount.tr(),
                    icon: Icon(Icons.person, color: AppColors.primary),
                    onPress: () {},
                  ),
                  CardProfile(
                    title: KeyLang.settings.tr(),
                    icon: Icon(Icons.settings, color: AppColors.primary),
                    onPress: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const ALertDialogSetting();
                        },
                      );
                    },
                  ),
                  CardProfile(
                    title: KeyLang.helpCenter.tr(),
                    icon: Icon(Icons.help, color: AppColors.primary),
                    onPress: () {},
                  ),
                  CardProfile(
                    title: KeyLang.logout.tr(),
                    icon: Icon(Icons.logout, color: AppColors.primary),
                    onPress: () {
                      AuthServices().signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageLogin.id, (route) => false);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
