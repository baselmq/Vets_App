import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Theme/theme_status.dart';
import '../../../../../../util/key_firebase.dart';
import '../../../../Auth/models/model_vet.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class AverageRate extends StatefulWidget {
  const AverageRate({
    super.key,
    required ModelVet vet,
    bool showNumReviews = true,
  })  : _vet = vet,
        _showNumReviews = showNumReviews;
  final ModelVet _vet;
  final bool _showNumReviews;

  @override
  State<AverageRate> createState() => _AverageRateState();
}

class _AverageRateState extends State<AverageRate> {
  double rating = 0;
  double totalRating = 0.0;
  int count = 0;
  int totalCount = 0;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection(KeyFirebase.colRating)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc[KeyFirebase.vetId] == widget._vet.id) {
          rating += doc[KeyFirebase.rating];
          count++;
        }
      }
      setState(() {
        totalRating = rating / count;
        totalCount = count;
        var f = NumberFormat("#.0", "en_US");
        totalRating = double.parse(f.format(totalRating));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$totalRating'),
        Icon(
          Icons.star_rounded,
          size: 18.sp,
          color: AppColors.primary,
        ),
        SizedBox(width: 10.w),
        widget._showNumReviews
            ? Text(
                '${totalCount.toString()} ${KeyLang.reviews.tr()}',
                style: AppTheme.bodyMedium(context: context)
                    ?.copyWith(color: Colors.grey[700]),
              )
            : Container(width: 0),
      ],
    );
  }
}
