import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Btn/simple_elevated_btn.dart';
import 'package:vets_app/Packages/Components/Btn/simple_outlined_btn.dart';
import 'package:vets_app/Packages/Pages/profile/components/radio_setting.dart';
import 'package:vets_app/Services/Theme/change_theme.dart';
import 'package:vets_app/Services/languages/change_lang.dart';
import '../../../../Language/Config/config_lang.dart';
import '../../../../Language/generated/key_lang.dart';
import 'package:easy_localization/easy_localization.dart';

class ALertDialogSetting extends StatefulWidget {
  const ALertDialogSetting({Key? key}) : super(key: key);

  @override
  State<ALertDialogSetting> createState() => _ALertDialogSettingState();
}

class _ALertDialogSettingState extends State<ALertDialogSetting> {
  Locale lang = ConfigLanguage.EN_LOCALE;

  @override
  Widget build(BuildContext context) {
    ChangeLang lang = Provider.of<ChangeLang>(context);
    ChangeThemes themes = Provider.of<ChangeThemes>(context);
    return SizedBox(
      width: 500,
      child: AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(10),
        title: Text(
          KeyLang.settings.tr(),
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: 180.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  KeyLang.selectLanguage.tr(),
                ),
              ),
              SimpleRadioSetting(
                onChanged: (value) {
                  lang.switchLang = value == 1
                      ? ConfigLanguage.EN_LOCALE
                      : ConfigLanguage.AR_LOCALE;
                  lang.switchValueGroup = value!;
                },
                textOne: KeyLang.english.tr(),
                textTwo: KeyLang.arabic.tr(),
                valueGroup: lang.valueGroup,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  KeyLang.themes.tr(),
                ),
              ),
              SimpleRadioSetting(
                onChanged: (value) {
                  themes.switchTheme = value == 1 ? true : false;
                  themes.switchValueGroup = value!;
                },
                textOne: KeyLang.dark.tr(),
                textTwo: KeyLang.light.tr(),
                valueGroup: themes.valueGroup,
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleOutlinedBtn(
                text: KeyLang.cancel.tr(),
                minimumSize: Size(120.w, 40.w),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SimpleElevatedBtn(
                text: KeyLang.ok.tr(),
                minimumSize: Size(120.w, 40.w),
                onTap: () {
                  EasyLocalization.of(context)!.setLocale(lang.lang);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: 15.h),

          // OutlinedButton(
          //   onPressed: () {},
          //   style: OutlinedButton.styleFrom(
          //     backgroundColor: Colors.transparent,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.sp),
          //     ),
          //   ),
          //   child: Text(
          //     KeyLang.cancel.tr(),
          //     style: AppTheme.bodyMedium(context: context)?.copyWith(
          //       color: isDarkMode ? Colors.white : Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
