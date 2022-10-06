import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';

import '../../../util/path_images.dart';

class ImageUser extends StatelessWidget {
  const ImageUser(
      {super.key,
      required String imageUrl,
      double? radius,
      double? sizeLoading})
      : _imageUrl = imageUrl,
        _sizeLoading = sizeLoading,
        _radius = radius;
  final String _imageUrl;
  final double? _radius;
  final double? _sizeLoading;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: _radius?.r,
          backgroundImage: imageProvider,
        );
      },
      placeholder: (context, url) => CircleAvatar(
        radius: _radius?.r,
        backgroundColor: Colors.transparent,
        child: AppAnimationLoading(
          type: TypeLoading.profile,
          size: _sizeLoading?.sp ?? 30.sp,
        ),
      ),
      errorWidget: (context, url, error) {
        return CircleAvatar(
          radius: _radius?.r,
          backgroundImage: const AssetImage(PathImage.notFoundUserPng),
        );
      },
    );
  }
}
