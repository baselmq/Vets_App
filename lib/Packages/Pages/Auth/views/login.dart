import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Btn/simple_elevated_btn.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Loading/loading_animation.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Packages/Pages/Auth/components/rich_text.dart';
import 'package:vets_app/Packages/Pages/Auth/views/forgot.dart';
import 'package:vets_app/Packages/Pages/Auth/views/register.dart';
import 'package:vets_app/Packages/Pages/Auth/views/wrapper_data.dart';
import 'package:vets_app/Packages/Provider/show_pass.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';
import 'package:vets_app/Services/Validators/app_validators.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:vets_app/util/key_firebase.dart';
import 'package:vets_app/util/path_icons.dart';

import '../../../../Services/Theme/change_theme.dart';
import '../../../Components/Toast/simple_toast.dart';
import '../components/card_social.dart';
import '../components/header_logo.dart';
import '../../../Components/textfield/simple_field.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});
  static const String id = 'PageLogin';

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final Map<String, dynamic> _dataLogin = {};
  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);
    final AuthServices auth = Provider.of<AuthServices>(context);
    return Scaffold(
      backgroundColor: themes.isDark ? AppColors.darkLight : AppColors.white,
      // appBar: const SimpleAppBar(title: 'Login'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header Logo
            ClipPath(
              clipper: MyCustomClipper(),
              child: const BackgroundContainer(
                child: SafeArea(
                  child: HeaderLogo(title: 'Welcome Back'),
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
                    SizedBox(height: 10.h),
                    //* Email
                    SimpleField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: PathIcons.email,
                      validator: (value) => AppValidators.isEmail(value),
                      onSaved: (value) =>
                          _dataLogin.addAll({KeyFirebase.email: value}),
                    ),
                    SizedBox(height: 20.h),
                    //* Password
                    ChangeNotifierProvider(
                      create: (context) => ProviderShowPass(),
                      child: Consumer<ProviderShowPass>(
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
                            onSaved: (value) => _dataLogin
                                .addAll({KeyFirebase.password: value}),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),

                    //* Forgot Password
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, PageForgot.id),
                          child: Text(
                            'Forgot Password?',
                            style:
                                AppTheme.bodyMedium(context: context)?.copyWith(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ),

                    SizedBox(height: 20.h),

                    //* Button

                    Center(
                      child: auth.isLoading
                          ? const AppAnimationLoading(type: TypeLoading.button)
                          : SimpleElevatedBtn(
                              text: 'Login',
                              onTap: () async {
                                if (_keyForm.currentState!.validate()) {
                                  _keyForm.currentState!.save();
                                  User? user = await auth.login(
                                      email: _dataLogin[KeyFirebase.email],
                                      password:
                                          _dataLogin[KeyFirebase.password]);

                                  if (user != null) {
                                    if (!mounted) return;
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        WrapperData.id, (route) => false);
                                  } else {
                                    simpleToast(message: auth.errorMessage);
                                  }
                                }
                              },
                            ),
                    ),
                    SizedBox(height: 50.h),
                    // SimpleOutlinedBtn(
                    //   text: 'login as a doctor',
                    //   onTap: () {
                    //     Navigator.pushNamed(context, PageLoginDoctor.id);
                    //   },
                    // ),
                    // SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaCard(
                          svgPath: PathIcons.google,
                          onTap: () {},
                        ),
                        SizedBox(width: 20.w),
                        SocialMediaCard(
                          svgPath: PathIcons.facebook,
                          svgWidth: 8,
                          onTap: () {},
                        ),
                        SizedBox(width: 20.w),
                        SocialMediaCard(
                          svgPath: PathIcons.twitter,
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    RichTextAuth(
                      firstWord: 'Don\'t have on account? ',
                      secondWord: 'Register',
                      onTap: () {
                        Navigator.pushNamed(context, PageRegister.id);
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
    );
  }
}
