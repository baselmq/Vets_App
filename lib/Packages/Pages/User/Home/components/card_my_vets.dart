import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_vet.dart';
import 'package:vets_app/Theme/app_colors.dart';

import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../../util/key_firebase.dart';
import '../../../../Components/cache_image/image_user.dart';
import '../../../../Components/favorite.dart';

class CardMyVets extends StatelessWidget {
  const CardMyVets({
    super.key,
    required ModelVet vet,
    required this.isFavorite,
    required this.width,
  }) : _vet = vet;
  final ModelVet _vet;
  final bool isFavorite;
  final double width;

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Stack(
      children: [
        Container(
          width: width.w,
          decoration: BoxDecoration(
            color: themes.isDark ? AppColors.darkLight : AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageUser(
                  imageUrl: _vet.image!,
                  radius: 32,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_vet.firstName} ${_vet.lastName}',
                      style: AppTheme.bodyMedium(context: context),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      _vet.location!,
                      style: AppTheme.bodySmall(context: context)
                          ?.copyWith(color: AppColors.gray),
                    ),
                    SizedBox(height: 10.h),
                    _vet.available ?? true
                        ? Container(
                            height: 16.5.h,
                            width: 136.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                color: AppColors.available,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Text(
                              'available in the clinic',
                              style: AppTheme.bodySmall(context: context)
                                  ?.copyWith(color: AppColors.green),
                            ),
                          )
                        : Container(
                            height: 16.5.h,
                            width: 159.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                color: AppColors.notAvailable,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Text(
                              'Not available in the clinic',
                              style: AppTheme.bodySmall(context: context)
                                  ?.copyWith(color: AppColors.red),
                            ),
                          ),
                  ],
                ),
                SizedBox(width: 20.w),
              ],
            ),
          )
        ),
        Positioned(
            right: 12,
            top: 12,
            child: BtnFavorite(
                onPress: () async {
                  await FirebaseFirestore.instance
                      .collection(KeyFirebase.colFavorite)
                      .get()
                      .then((QuerySnapshot querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      if (doc[KeyFirebase.vetId] == _vet.id) {
                        var id = doc.id;
                        var deleteFavorite = FirebaseFirestore.instance
                            .collection(KeyFirebase.colFavorite)
                            .doc(id);
                        deleteFavorite.delete();
                      }
                    }
                  });
                },
                favorite: isFavorite)),
      ],
    );
  }
}
