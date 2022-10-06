import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/app_colors.dart';

void simpleToastOk({required String message, ToastGravity? gravity}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: gravity ?? ToastGravity.CENTER,
    backgroundColor: AppColors.primary,
    textColor: AppColors.white,
    fontSize: 16.sp,
    timeInSecForIosWeb: 1,
  );
}
