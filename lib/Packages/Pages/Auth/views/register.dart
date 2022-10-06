import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Btn/simple_elevated_btn.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Pages/Auth/views/doctorPages/info_vet.dart';
import 'package:vets_app/Packages/Pages/Auth/views/info.dart';
import 'package:vets_app/Packages/Provider/show_confirm_pass.dart';
import 'package:vets_app/Packages/Provider/show_pass.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';
import 'package:vets_app/Services/Authentication/send_data_vet.dart';
import 'package:vets_app/Services/Validators/app_validators.dart';
import 'package:vets_app/util/key_firebase.dart';
import '../../../../Services/Theme/change_theme.dart';
import '../../../../Theme/app_colors.dart';
import '../../../../util/path_icons.dart';
import '../../../Components/Toast/simple_toast.dart';
import '../../../Provider/radio_provider.dart';
import '../components/header_logo.dart';
import '../components/info_user/simple_radio.dart';
import '../components/rich_text.dart';
import '../../../Components/textfield/simple_field.dart';
import '../models/model_user.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});
  static const String id = 'PageRegister';

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final Map<String, dynamic> _dataRegister = {};
  final ModelUser _modelUser = ModelUser();
  String? typeUser;

  String? _pass;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // !
    final AuthServices auth = Provider.of<AuthServices>(context);
    final VetData vetData = Provider.of<VetData>(context);
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderRadio()),
        ChangeNotifierProvider(create: (context) => ProviderShowPass()),
        ChangeNotifierProvider(create: (context) => ProviderConfirmPass()),
      ],
      child: Scaffold(
        backgroundColor: themes.isDark ? AppColors.darkLight : AppColors.white,
        // appBar: const SimpleAppBar(title: 'Login'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //* Header Logo
              ClipPath(
                clipper: MyCustomClipper(),
                child: const BackgroundContainer(
                  child: SafeArea(child: HeaderLogo(title: 'Register Account')),
                ),
              ),

              //* Form
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),

                      //* Email
                      SimpleField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: PathIcons.email,
                        validator: (value) => AppValidators.isEmail(value),
                        onSaved: (value) =>
                            _dataRegister.addAll({KeyFirebase.email: value}),
                      ),
                      SizedBox(height: 20.h),

                      //* Password
                      Consumer<ProviderShowPass>(
                        builder: (context, value, child) {
                          return SimpleField(
                            hintText: 'Password',
                            isObscureText: value.isObscure,
                            keyboardType: TextInputType.text,
                            prefixIcon: PathIcons.password,
                            suffixIcon: value.iconSuffix,
                            onSIcon: () => value.viewPass(),
                            validator: (value) =>
                                AppValidators.isPassword(value),
                            onChanged: (value) => _pass = value,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),

                      //*Confirm Password
                      Consumer<ProviderConfirmPass>(
                        builder: (context, value, child) {
                          return SimpleField(
                            hintText: 'Confirm Password',
                            isObscureText: value.isObscureConfirm,
                            keyboardType: TextInputType.text,
                            prefixIcon: PathIcons.password,
                            suffixIcon: value.iconSuffixConfirm,
                            onSIcon: () => value.viewConfirmPass(),
                            validator: (value) => AppValidators.isEqualPassword(
                                value, _pass ?? ''),
                            onSaved: (value) => _dataRegister
                                .addAll({KeyFirebase.password: value}),
                          );
                        },
                      ),
                      SizedBox(height: 20.h),

                      //* Radio Button
                      SimpleRadio(
                        onChoose: (value) {
                          typeUser =
                              value == 1 ? KeyFirebase.user : KeyFirebase.vet;
                        },
                      ),
                      SizedBox(height: 30.h),

                      //* Button
                      Consumer<ProviderRadio>(
                        builder: (context, value, child) {
                          return Center(
                            child: auth.isLoading
                                ? const AppAnimationLoading(
                                    type: TypeLoading.button)
                                : SimpleElevatedBtn(
                                    text: 'Register',
                                    onTap: () async {
                                      // Navigator.pushNamed(
                                      //     context, PageCompleteProfile.id);
                                      if (_keyForm.currentState!.validate()) {
                                        if (typeUser == null) {
                                          simpleToast(
                                              message:
                                                  'Please select user type');
                                        } else {
                                          vetData.setTypeUser = typeUser!;
                                          _keyForm.currentState!.save();
                                          User? user = await auth.register(
                                              email: _dataRegister[
                                                  KeyFirebase.email],
                                              password: _dataRegister[
                                                  KeyFirebase.password]);

                                          if (user != null) {
                                            // * check type user

                                            if (vetData.typeUser ==
                                                KeyFirebase.user) {
                                              if (!mounted) return;
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  PageInfoUser.id,
                                                  (route) => false);
                                            } else {
                                              if (!mounted) return;
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  PageInfoVet.id,
                                                  (route) => false);
                                            }

                                            // Navigator.pushNamedAndRemoveUntil(
                                            //     context,
                                            //     PageInfoUser.id,
                                            //     (route) => false);

                                          } else {
                                            simpleToast(
                                                message: auth.errorMessage);
                                          }
                                        }
                                      }
                                    },
                                  ),
                          );
                        },
                      ),
                      SizedBox(height: 20.h),

                      //* Rich Text
                      RichTextAuth(
                        firstWord: 'have on account? ',
                        secondWord: 'Login',
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(height: 10.h),
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

   // if (value.type == value.user) {
  //   Navigator.pushNamed(
                                          //       context, CompleteProfile.id);
                                          // } else {
                                          //   Navigator.pushNamed(
                                          //       context, PageLogin.id);
                                          // }
                                        
                                        // if (_keyForm.currentState!.validate()) {
                                        //   _keyForm.currentState!.save();
                                        //   try {
                                        //     final newUser = await _auth
                                        //         .createUserWithEmailAndPassword(
                                        //             email: _dataRegister[
                                        //                 KeyFirebase.email],
                                        //             password: _dataRegister[
                                        //                 KeyFirebase.password]);
                                        //     if (value.type == value.user) {
                                        //       Navigator.pushNamed(
                                        //           context, CompleteProfile.id);
                                        //     } else {
                                        //       Navigator.pushNamed(
                                        //           context, PageLogin.id);
                                        //     }
                                        //   } catch (e) {
                                        //     print(e);
                                        //   }
                                        // }