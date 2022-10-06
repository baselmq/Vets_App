import 'package:flutter/material.dart';
import 'package:vets_app/util/path_images.dart';

class DetailsBgImage extends StatelessWidget {
  const DetailsBgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          left: 30,
          child: Image.asset(PathImage.details1, width: 15),
        ),
        Positioned(
          top: 10,
          left: 150,
          child: Image.asset(PathImage.details2, width: 8),
        ),
        Positioned(
          top: 30,
          right: 30,
          child: Image.asset(PathImage.details3, width: 15),
        ),
        Positioned(
          bottom: 50,
          left: 30,
          child: Image.asset(PathImage.details4, width: 25),
        ),
        // Positioned(
        //   bottom: 25,
        //   left: 160,
        //   child: Image.asset(PathImage.details5, width: 15),
        // ),
        Positioned(
          bottom: 50,
          right: 30,
          child: Image.asset(PathImage.details6, width: 15),
        ),
      ],
    );
  }
}
