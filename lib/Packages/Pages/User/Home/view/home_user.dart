import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Components/textfield/simple_field.dart';
import 'package:vets_app/Packages/Pages/User/Home/view/bookings.dart';
import 'package:vets_app/Packages/Pages/User/Home/view/my_pets.dart';
import 'package:vets_app/Services/Authentication/get_data.dart';
import 'package:vets_app/util/path_icons.dart';
import 'package:vets_app/util/path_images.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../Components/header_home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'my_vets.dart';

class PageHomeUser extends StatefulWidget {
  const PageHomeUser({super.key});
  static const String id = 'PageHomeUser';

  @override
  State<PageHomeUser> createState() => _PageHomeUserState();
}

class _PageHomeUserState extends State<PageHomeUser> {
  @override
  Widget build(BuildContext context) {
    GetData data = Provider.of<GetData>(context, listen: false);
            ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    // GetData data = context.watch<GetData>();
    return Scaffold(
      backgroundColor: themes.isDark ? AppColors.darkWidget : AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: BackgroundContainer(
                height: 220.h,
                child: HeaderHome(
                  circleImage: '${data.modelUser!.image}',
                  backgroundImage: PathImage.coverUser,
                  backgroundImageAr: PathImage.coverUserAr,
                  nameUser:
                      '${data.modelUser!.firstName} ${data.modelUser!.lastName}',
                  text: KeyLang.haveCanWeHelp.tr(),
                ),
              ),
            ),
            // const CardBookingUser(
            //   imageUrl: PathImage.circleImage,
            //   name: 'Dr name',
            //   subText: 'Amman',
            //   bookingTime: '9:30',
            //   bookingDate: '15',
            // ),
            const BookingUser(),
            const MyVets(),
            const MyPets(),

            // Container(
            //   height: 80.h,
            //   width: double.infinity,
            //   margin: EdgeInsets.all(20.w),
            //   decoration: BoxDecoration(
            //     color: AppColors.greyLight,
            //     borderRadius: BorderRadius.circular(12.r),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(10.w),
            //     child: Column(
            //       children: [
            //         ElevatedButton(
            //           onPressed: () {
            //             showAlertDialog(context);
            //           },
            //           style: ElevatedButton.styleFrom(
            //             elevation: 0,
            //             backgroundColor: AppColors.white,
            //             shape: const CircleBorder(),
            //           ),
            //           child: SvgPicture.asset(
            //             PathIcons.add,
            //             width: 15.w,
            //             color: AppColors.greyIconAdd,
            //           ),
            //         ),
            //         Text('Add Favorite',
            //             style: AppTheme.bodySmall(context: context))
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            const ImageAnimals(),
            SizedBox(height: 20.h),
            const SimpleField(
              labelText: 'name of the animal',
            ),
            SizedBox(height: 10.h),
            const SimpleField(
              labelText: 'animal type',
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        scrollable: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class ImageAnimals extends StatelessWidget {
  const ImageAnimals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          backgroundImage: const AssetImage(PathImage.animals),
          radius: 45.r,
        ),
        Positioned(
          right: -20,
          bottom: -5,
          child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.bgColor,
                shape: const CircleBorder(),
                side: BorderSide(color: AppColors.primary),
                // padding: EdgeInsets.all(13.w),
              ),
              child: PathIcons.camera),
        )
      ],
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:vets_app/Packages/Components/container_background.dart';
// import 'package:vets_app/Packages/Pages/User/home/components/my_vets.dart';
// import 'package:vets_app/Theme/theme_status.dart';
// import 'package:vets_app/util/path_images.dart';
// import '../../../../../Theme/app_colors.dart';
// import '../../../../Components/container_rounded.dart';
// import '../../../Doctor/home/components/header.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PageHomeUser extends StatefulWidget {
//   const PageHomeUser({super.key});
//   static const String id = 'PageHomeUser';

//   @override
//   State<PageHomeUser> createState() => _PageHomeUserState();
// }

// class _PageHomeUserState extends State<PageHomeUser> {
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   // late User signedInUser;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getCurrentUser();
//   // }

//   // void getCurrentUser() {
//   //   try {
//   //     final user = _auth.currentUser;
//   //     if (user != null) {
//   //       signedInUser = user;
//   //       print(signedInUser.email);
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: BackgroundContainer(
//         width: double.infinity,
//         height: double.infinity,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const HeaderHome(
//                 circleImage: PathImage.circleImage,
//                 backgroundImage: PathImage.coverUser,
//                 nameUser: 'Roeselien',
//                 text: 'Have can we help?',
//               ),
//               ContainerRounded(
//                 color: AppColors.bgColor,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10.w),
//                       child: Text(
//                         'My Vets',
//                         style: AppTheme.bodyMedium(context: context)
//                             ?.copyWith(color: AppColors.gray),
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     SizedBox(
//                       height: 86.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 2,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             children: [
//                               SizedBox(width: 10.w),
//                               Padding(
//                                 padding: index == 2 - 1
//                                     ? EdgeInsets.only(right: 10.w)
//                                     : const EdgeInsets.only(right: 0),
//                                 child: const MyVets(
//                                     imageUrl: PathImage.circleImage,
//                                     name: 'Dr. Carly Garcia',
//                                     available: true),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
