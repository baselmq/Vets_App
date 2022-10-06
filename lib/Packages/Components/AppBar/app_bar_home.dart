import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/path_images.dart';
import '../../Pages/Auth/models/model_vet.dart';
import '../Clipper/custom_clip_path.dart';
import '../container_background.dart';
import '../header_home.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({required ModelVet vet, super.key, this.height})
      : _vet = vet;
  final ModelVet _vet;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(width: 0),
      flexibleSpace: ClipPath(
        clipper: MyCustomClipper(),
        child: BackgroundContainer(
          height: 225.h,
          child: Column(
            children: [
              SizedBox(height: 10.h),
              HeaderHome(
                circleImage: '${_vet.image}',
                backgroundImage: PathImage.cover,
                backgroundImageAr: PathImage.coverAr,
                nameUser: '${_vet.firstName} ${_vet.lastName}',
                text: 'Have a Nice Day',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 100);
}
