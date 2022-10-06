import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/AppBar/app_bar_home.dart';

import 'package:vets_app/Packages/Pages/Doctor/Home/consultations/consultations.dart';
import 'package:vets_app/Packages/Pages/Doctor/Home/view/booking.dart';
import 'package:vets_app/Theme/app_colors.dart';

import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Theme/change_theme.dart';

class PageDrHome extends StatelessWidget {
  const PageDrHome({super.key});

  @override
  Widget build(BuildContext context) {
    GetData data = Provider.of<GetData>(context);
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Scaffold(
      backgroundColor: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      appBar: AppBarHome(
        vet: data.modelVet!,
        height: 200.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * BookingVet
                const BookingVet(),
                SizedBox(height: 20.h),
                const Consultations(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
