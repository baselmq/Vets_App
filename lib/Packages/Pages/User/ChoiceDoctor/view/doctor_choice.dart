import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_vet.dart';
import 'package:vets_app/Packages/Pages/User/ChoiceDoctor/components/card_choice.dart';
import 'package:vets_app/Packages/Pages/User/ChoiceDoctor/components/filter.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/util/path_icons.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../Services/Theme/change_theme.dart';
class PageDoctorChoice extends StatelessWidget {
  const PageDoctorChoice({super.key});
  static const String id = 'PageDoctorChoice';

  @override
  Widget build(BuildContext context) {
            ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Scaffold(
      backgroundColor: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: BackgroundContainer(
                height: 120.h,
                child: Stack(
                  children: [
                    Image.asset(PathImage.cover2),
                    Center(
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            KeyLang.doctors.tr(),
                            textAlign: TextAlign.center,
                            style: AppTheme.titleLarge(context: context)
                                ?.copyWith(color: AppColors.white),
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            const FilterLocation();
                          },
                          child: PathIcons.filter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const FilterLocation(),
                ),
                StreamBuilder<List<ModelVet>>(
                  stream: AuthServices().getAllVets(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child:
                              Text('Something went wrong! ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return SizedBox(
                        height: 520.h,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final snap = snapshot.data?[index];
                            return CardChoiceVet(vet: snap!);
                          },
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 520.h,
                        child: const Center(
                            child: AppAnimationLoading(type: TypeLoading.page)),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
