import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Pages/Auth/components/header_logo.dart';
import 'package:vets_app/Packages/Pages/Auth/components/info_user/info_image.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_vet.dart';
import 'package:vets_app/Packages/Pages/Auth/views/doctorPages/complete_vet.dart';
import 'package:vets_app/Packages/Provider/radio_provider.dart';
import 'package:vets_app/Services/Validators/app_validators.dart';

import '../../../../../Services/Authentication/auth_services.dart';
import '../../../../../Services/Authentication/profile_image.dart';
import '../../../../../Services/Authentication/send_data_vet.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../util/path_icons.dart';
import '../../../../Components/Btn/simple_elevated_btn.dart';
import '../../../../Components/Toast/simple_toast.dart';
import '../../../../Components/textfield/simple_field.dart';

class PageInfoVet extends StatelessWidget {
  PageInfoVet({super.key});

  static const String id = 'PageInfoVet';
  // * Key Form
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  // * Storage
  final ModelVet _modelVet = ModelVet();

  @override
  Widget build(BuildContext context) {
    final ProfileImage provideImage = Provider.of<ProfileImage>(context);
    final AuthServices auth = Provider.of<AuthServices>(context);
    final VetData vetData = Provider.of<VetData>(context);
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return ChangeNotifierProvider(
      create: (context) => ProviderRadio(),
      child: Scaffold(
        backgroundColor: themes.isDark ? AppColors.darkLight : AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //* Header Logo
              ClipPath(
                clipper: MyCustomClipper(),
                child: const BackgroundContainer(
                  child: SafeArea(
                    child: HeaderLogo(
                      height: 170,
                      widthImage: 100,
                      title: 'Complete Profile',
                    ),
                  ),
                ),
              ),

              //* Form
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      const InfoImage(),
                      SizedBox(height: 20.h),

                      //* First Name
                      SimpleField(
                        hintText: 'First Name',
                        prefixIcon: PathIcons.person,
                        validator: (value) => AppValidators.isEmpty(value),
                        onSaved: (value) => vetData.setFName = value!,
                      ),
                      SizedBox(height: 20.h),

                      //* Last Name
                      SimpleField(
                        hintText: 'Last Name',
                        prefixIcon: PathIcons.person,
                        validator: (value) => AppValidators.isEmpty(value),
                        onSaved: (value) => vetData.setLName = value!,
                      ),
                      SizedBox(height: 20.h),

                      //* Phone
                      SimpleField(
                        hintText: 'Phone',
                        keyboardType: TextInputType.phone,
                        prefixIcon: PathIcons.phone,
                        validator: (value) =>
                            AppValidators.isPhoneNumber(value),
                        onChanged: (value) {
                          if (value.length == 10) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        onSaved: (value) => vetData.setPhone = value!,
                      ),
                      SizedBox(height: 20.h),

                      //* Location
                      SimpleField(
                        hintText: 'Location',
                        prefixIcon: PathIcons.location,
                        validator: (value) => AppValidators.isEmpty(value),
                        onSaved: (value) => vetData.setLocation = value!,
                      ),
                      // //* Radio Button
                      // SimpleRadio(
                      //   onChoose: (value) {
                      //     _modelUser.type =
                      //         value == 1 ? KeyFirebase.user : KeyFirebase.vet;
                      //   },
                      // ),

                      // SimpleElevatedBtn(
                      //   text: 'Select working days',
                      //   onTap: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) => const SelectWorkingDays(),
                      //     );
                      //   },
                      // ),

                      SizedBox(height: 30.h),

                      //* Button
                      provideImage.isLoading
                          ? const AppAnimationLoading(type: TypeLoading.button)
                          : SimpleElevatedBtn(
                              text: 'Continue',
                              // onTap: () {
                              //   _modelUser.type = typeUser;
                              //   print('modelUser.type: ${_modelUser.type}');
                              // },
                              onTap: () async {
                                if (_keyForm.currentState!.validate()) {
                                  _keyForm.currentState?.save();

                                  // * check image provider
                                  if (provideImage.image == null) {
                                    simpleToast(
                                        message:
                                            'Please choose a profile picture');
                                  } else {
                                    Navigator.pushNamed(
                                        context, CompleteProfileVet.id);
                                  }
                                }
                              },
                            ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
