import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../../../../../Services/Authentication/profile_image.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../../util/path_icons.dart';

class AlertChooseImage extends StatefulWidget {
  const AlertChooseImage({Key? key}) : super(key: key);

  @override
  State<AlertChooseImage> createState() => _AlertChooseImageState();
}

class _AlertChooseImageState extends State<AlertChooseImage> {
  final _picker = ImagePicker();

  Future<File?> _getImage({bool isCamera = false}) async {
    try {
      final pickedImage = await _picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (pickedImage != null) {
        return File(pickedImage.path);
      } else {
        throw Exception('not show image');
      }
    } catch (e) {
      debugPrint('error : $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ProfileImage provideImage = Provider.of<ProfileImage>(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 50.w,
        height: provideImage.image != null ? 130.h : 100.h,
        child: Column(
          children: [
            // * camera
            Expanded(
              child: ListTile(
                title: const Text('Camera'),
                leading: PathIcons.camera,
                onTap: () async {
                  File? image = await _getImage(isCamera: true);
                  if (image != null) {
                    provideImage.setImage = image;
                  }
                  if (mounted) return;
                  Navigator.pop(context);
                },
              ),
            ),
            // * gallery
            Expanded(
              child: ListTile(
                title: const Text('Gallery'),
                leading: PathIcons.gallery,
                onTap: () async {
                  File? image = await _getImage();
                  if (image != null) {
                    provideImage.setImage = image;
                  }
                  if (mounted) return;
                  Navigator.pop(context);
                },
              ),
            ),
            // * remove image
            if (provideImage.image != null)
              Expanded(
                child: ListTile(
                  title: const Text('Remove Image'),
                  leading: PathIcons.trash,
                  onTap: () {
                    provideImage.setImage = null;
                    Navigator.pop(context);
                  },
                ),
              )
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.getTheme(context: context)
                ? Colors.white
                : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
