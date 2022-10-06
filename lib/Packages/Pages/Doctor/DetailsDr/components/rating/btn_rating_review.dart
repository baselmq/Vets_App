import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/view/rating_review.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../Services/Theme/change_theme.dart';
import '../../../../../../Theme/app_colors.dart';
import '../../../../../../Theme/theme_status.dart';
import '../../../../../../util/path_icons.dart';
import '../../../../Auth/models/model_vet.dart';

// ? PageDrDetails
class BtnRatingAndReview extends StatelessWidget {
  const BtnRatingAndReview({
    super.key,
    required ModelVet vet,
  }) : _vet = vet;
  final ModelVet _vet;
  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageRatingsAndReviews(vet: _vet),
            ));
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: themes.isDark ? AppColors.darkLight : AppColors.white,
            border: Border(
                top: BorderSide(
                    color: themes.isDark
                        ? AppColors.darkWidget
                        : AppColors.bgColor))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Text(
                KeyLang.ratingAndReviews.tr(),
                style: AppTheme.titleMedium(context: context),
              ),
              const Spacer(),
              PathIcons.arrowRight,
            ],
          ),
        ),
      ),
    );
  }
}
