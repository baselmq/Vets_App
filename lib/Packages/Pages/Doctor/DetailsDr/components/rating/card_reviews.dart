import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vets_app/Packages/Components/Time/format_date.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_rating.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Theme/app_colors.dart';
import '../../../../../Components/cache_image/image_user.dart';

class CardReviews extends StatelessWidget {
  const CardReviews({
    super.key,
    required ModelRating rating,
  }) : _rating = rating;
  final ModelRating _rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageUser(imageUrl: _rating.imageUser!),
                SizedBox(width: 10.w),
                Text(_rating.nameUser!,
                    style: AppTheme.bodyMedium(context: context)),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                // * rating Bar
                RatingBarIndicator(
                  rating: _rating.rating!,
                  itemCount: 5,
                  itemSize: 18,
                  direction: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Icon(Icons.star_rate_rounded,
                        color: AppColors.primary);
                  },
                ),

                SizedBox(width: 10.w),
                Text(formatDate(_rating.dateRating!, 'dd/MM/yyyy'),
                    style: AppTheme.bodyMedium(context: context)),
              ],
            ),
            SizedBox(height: 15.h),
            _rating.describeExperience != null
                ? Text(
                    _rating.describeExperience!,
                    style: AppTheme.bodyMedium(context: context),
                  )
                : Container(width: 0),
          ],
        ),
      ),
    );
  }
}
