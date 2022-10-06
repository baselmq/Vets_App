import 'package:flutter/material.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Pages/Auth/views/login.dart';
import 'package:vets_app/Packages/Pages/Auth/views/wrapper_data.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  static const String id = 'Wrapper';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices().user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: AppAnimationLoading(type: TypeLoading.page),
            ),
          );
        }
        if (snapshot.hasData) {
          return const WrapperData();
        } else {
          return const PageLogin();
        }
      },
    );
  }
}
// class Wrapper extends StatelessWidget {
//   const Wrapper({super.key});
//   static const String id = 'Wrapper';

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: AuthServices().user,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//               child: AppAnimationLoading(type: TypeLoading.page),
//             ),
//           );
//         }
//         if (snapshot.hasData) {
//           return const BodyUser();
//         } else {
//           return const PageLogin();
//         }
//       },
//     );
//   }
// }
