import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../Auth/models/model_vet.dart';

class DescriptionVet extends StatelessWidget {
  const DescriptionVet({
    super.key,
    required ModelVet vet,
  }) : _vet = vet;
  final ModelVet _vet;
  @override
  Widget build(BuildContext context) {
            ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Container(
      height: 270.h,
      width: double.infinity,
      color: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                children: [
                  Text(
                    '${_vet.description}',
                    style: AppTheme.bodyLarge(context: context),
                  ),
                  SizedBox(height: 85.h),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 45,
          //   right: 110,
          //   child: SimpleElevatedBtn(
          //     minimumSize: Size(150.w, 45.w),
          //     text: 'Book Now',
          //     onTap: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) => ButtonBooking(
          //             vetId: _vet.id!,
          //             nameVet: '${_vet.firstName!} ${_vet.lastName!}'),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
// Column(
//           children: [
//             Text(
//               'datadatadatadatadatatadtadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatatadtadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatatadtadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
//               style: AppTheme.bodyLarge(context: context),
//             ),
//             SizedBox(height: 30.h),
//             SimpleElevatedBtn(
//               minimumSize: Size(150.w, 45.w),
//               text: 'Book Now',
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const Booking(),
//                 );
//               },
//             )
//           ],
//         ),