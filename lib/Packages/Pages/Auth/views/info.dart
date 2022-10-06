import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Pages/Auth/components/header_logo.dart';
import 'package:vets_app/Packages/Pages/Auth/components/info_user/info_image.dart';
import 'package:vets_app/Packages/Pages/Auth/models/model_user.dart';
import 'package:vets_app/Packages/Pages/Auth/views/wrapper.dart';
import 'package:vets_app/Packages/Provider/radio_provider.dart';
import 'package:vets_app/Services/Validators/app_validators.dart';
import '../../../../Services/Authentication/auth_services.dart';
import '../../../../Services/Authentication/profile_image.dart';
import '../../../../Services/Authentication/send_data_vet.dart';
import '../../../../Services/Theme/change_theme.dart';
import '../../../../Theme/app_colors.dart';
import '../../../../util/path_icons.dart';
import '../../../Components/Btn/simple_elevated_btn.dart';
import '../../../Components/Toast/simple_toast.dart';
import '../../../Components/textfield/simple_field.dart';
import 'package:path/path.dart' as path;

class PageInfoUser extends StatefulWidget {
  const PageInfoUser({super.key});

  static const String id = 'PageInfoUser';

  @override
  State<PageInfoUser> createState() => _PageInfoUserState();
}

class _PageInfoUserState extends State<PageInfoUser> {
  // * Key Form
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  // * Storage
  final ModelUser _modelUser = ModelUser();

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
                        onSaved: (value) => _modelUser.firstName = value,
                      ),
                      SizedBox(height: 20.h),

                      //* Last Name
                      SimpleField(
                        hintText: 'Last Name',
                        prefixIcon: PathIcons.person,
                        validator: (value) => AppValidators.isEmpty(value),
                        onSaved: (value) => _modelUser.lastName = value,
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
                        onSaved: (value) => _modelUser.phone = value,
                      ),
                      SizedBox(height: 20.h),

                      // //* Radio Button
                      // SimpleRadio(
                      //   onChoose: (value) {
                      //     _modelUser.type =
                      //         value == 1 ? KeyFirebase.user : KeyFirebase.vet;
                      //   },
                      // ),
                      SizedBox(height: 30.h),

                      //* Button
                      provideImage.isLoading
                          ? const AppAnimationLoading(type: TypeLoading.button)
                          : SimpleElevatedBtn(
                              text: 'Send',
                              // onTap: () {
                              //   _modelUser.type = typeUser;
                              //   print('modelUser.type: ${_modelUser.type}');
                              // },
                              onTap: () async {
                                if (_keyForm.currentState!.validate()) {
                                  _keyForm.currentState?.save();
                                  // * check type user

                                  // * check image provider
                                  if (provideImage.image == null) {
                                    simpleToast(
                                        message:
                                            'Please choose a profile picture');
                                  } else {
                                    String pathImage =
                                        path.basename(provideImage.image!.path);
                                    String directory = 'user/$pathImage';
                                    String urlPhoto =
                                        await provideImage.uploadImage(
                                            directory: directory,
                                            image: provideImage.image!);

                                    // * check return url
                                    if (urlPhoto.isNotEmpty) {
                                      // * Preparation user Data
                                      _modelUser.image = urlPhoto;
                                      _modelUser.type = vetData.typeUser;

                                      // * save in DataBase info user
                                      bool result = await auth.addInfoUser(
                                          modelUser: _modelUser);
                                      // * check successfully or Failed
                                      if (result) {
                                        provideImage.setLoading = false;
                                        if (!mounted) return;
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            Wrapper.id,
                                            (route) => false);
                                      } else {
                                        provideImage.setLoading = false;
                                        simpleToast(
                                            message: provideImage.errorMessage);
                                      }
                                    } else {
                                      simpleToast(
                                          message: provideImage.errorMessage);
                                    }
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
