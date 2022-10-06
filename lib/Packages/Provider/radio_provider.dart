import 'package:flutter/material.dart';

enum Gender { user, vet, type }

class ProviderRadio with ChangeNotifier {
  Gender? typeGroup = Gender.type;
  Gender user = Gender.user;
  Gender vet = Gender.vet;

  changeType() {
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import '../../../../Theme/app_colors.dart';
// import '../../../../Theme/theme_status.dart';
// import '../../../Provider/radio_provider.dart';

// class SimpleRadio extends StatelessWidget {
//   const SimpleRadio({
//     super.key,
//     required String textOne,
//     required String textTwo,
//   })  : _textOne = textOne,
//         _textTwo = textTwo;

//   final String _textOne;
//   final String _textTwo;

//   @override
//   Widget build(BuildContext context) {
//     var valueRadio = Provider.of<ProviderRadio>(context);

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.gray),
//         borderRadius: BorderRadius.circular(13.r),
//       ),
//       child: Row(
//         children: [
//           Text(_textOne, style: AppTheme.bodyLarge(context: context)),
//           Radio(
//             activeColor: AppColors.primary,
//             value: valueRadio.user,
//             groupValue: valueRadio.typeGroup,
//             onChanged: (value) {
//               valueRadio.typeGroup = value;
//               valueRadio.changeType();
//             },
//           ),
//           Text(_textTwo, style: AppTheme.bodyLarge(context: context)),
//           Radio(
//             activeColor: AppColors.primary,
//             value: valueRadio.vet,
//             groupValue: valueRadio.typeGroup,
//             onChanged: (value) {
//               valueRadio.typeGroup = value;
//               valueRadio.changeType();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
