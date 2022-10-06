import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Services/Theme/change_theme.dart';
import '../../../../Components/cache_image/image_user.dart';
import '../../../Auth/models/model_vet.dart';
import '../components/contact_information.dart';
import '../components/description.dart';
import '../components/rating/btn_rating_review.dart';

class PageDrDetails extends StatelessWidget {
  const PageDrDetails({
    super.key,
    required ModelVet vet,
  }) : _vet = vet;
  final ModelVet _vet;
  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Scaffold(
        backgroundColor: themes.isDark ? AppColors.darkLight : AppColors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: BackgroundContainer(
                      height: 150.h,
                      child: Image.asset(PathImage.cover2),
                    ),
                  ),
                  Column(
                    children: [
                      ContactInformation(vet: _vet),
                      BtnRatingAndReview(vet: _vet),
                      DescriptionVet(vet: _vet),
                      // Booking(),
                    ],
                  )
                ],
              ),
              Positioned(
                  top: 85,
                  left: 128,
                  child: ImageUser(
                    imageUrl: '${_vet.image}',
                    radius: 55,
                  )),
            ],
          ),
        ));
  }
}
