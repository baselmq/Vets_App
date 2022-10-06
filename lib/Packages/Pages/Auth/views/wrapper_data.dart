import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Pages/Doctor/body.dart';
import 'package:vets_app/Packages/Pages/User/body.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';

import '../../../../Services/Authentication/get_data.dart';
import 'login.dart';

class WrapperData extends StatelessWidget {
  const WrapperData({super.key});
  static const String id = 'WrapperData';

  @override
  Widget build(BuildContext context) {
    GetData getData = Provider.of<GetData>(context, listen: false);
    // GetData getData = context.read();
    return StreamBuilder(
      stream: AuthServices().getDocumentVet(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: AppAnimationLoading(type: TypeLoading.page),
            ),
          );
        }
        if (snapshot.hasData) {
          getData.setModelVet = snapshot.data;
          return const BodyDr();
        } else {
          return StreamBuilder(
            stream: AuthServices().getDocumentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: AppAnimationLoading(type: TypeLoading.page),
                  ),
                );
              }
              if (snapshot.hasData) {
                getData.setModelUser = snapshot.data;
                return const BodyUser();
              } else {
                return const PageLogin();
              }
            },
          );
        }
      },
    );
  }
}
