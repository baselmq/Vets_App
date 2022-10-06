import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/app_colors.dart';

void simpleToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.red,
    textColor: AppColors.white,
    fontSize: 16.sp,
    timeInSecForIosWeb: 1,
  );
}
