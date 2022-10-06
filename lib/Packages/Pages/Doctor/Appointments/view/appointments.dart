import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Time/format_date.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Pages/Doctor/Appointments/components/select_date.dart';
import 'package:vets_app/Packages/Provider/appointment_provider.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:vets_app/util/path_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/util/path_images.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../Services/Theme/change_theme.dart';
class PageAppointments extends StatefulWidget {
  const PageAppointments({super.key});

  @override
  State<PageAppointments> createState() => _PageAppointmentsState();
}

class _PageAppointmentsState extends State<PageAppointments> {
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    AppointmentProvider date =
        Provider.of<AppointmentProvider>(context, listen: false);
                ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);


    return Scaffold(
      backgroundColor:themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      body: Column(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: BackgroundContainer(
              height: 120.h,
              child: Stack(
                children: [
                  Image.asset(PathImage.cover2),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatDate(DateTime.now().toString(), 'MMM'),
                          style: AppTheme.bodySmall(context: context)
                              ?.copyWith(color: AppColors.onPrimary),
                        ),
                        Text(
                          KeyLang.appointments.tr(),
                          style: AppTheme.titleLarge(context: context)
                              ?.copyWith(color: AppColors.white),
                        ),
                        PathIcons.calendarDays(color: AppColors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SelectDate(),
          const ShowBookingByDate(),

          // date.appointmentList.isEmpty
          //     ? Expanded(
          //         child: Stack(
          //           children: [
          //             // FlitterListBookings(selectedDate: date.selectedDate!),
          //             SingleChildScrollView(
          //               child: Wrap(
          //                 alignment: WrapAlignment.center,
          //                 direction: Axis.horizontal,
          //                 children: [
          //                   Padding(
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: 10.w, vertical: 40.h),
          //                     child: Image.asset(PathImage.noAppointment),
          //                   ),
          //                   Text(
          //                     'There are no appointments',
          //                     style: AppTheme.bodyLarge(context: context)
          //                         ?.copyWith(fontSize: 16.sp),
          //                   ),
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     : Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: Container(
          //           child: Row(
          //             children: [
          //               Expanded(
          //                   child: SingleChildScrollView(
          //                 child: Column(),
          //               )),
          //               Container(
          //                 margin: const EdgeInsets.symmetric(horizontal: 10),
          //                 height: 60,
          //                 width: 0.5,
          //                 color: Colors.grey[200]!.withOpacity(0.7),
          //               ),
          //               const RotatedBox(
          //                 quarterTurns: 3,
          //                 child: Text('data'),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
        ],
      ),
    );
  }
}
