import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/Clipper/custom_clip_path.dart';
import 'package:vets_app/Packages/Components/Loading/app_loading.dart';
import 'package:vets_app/Packages/Components/Loading/enum_loading.dart';
import 'package:vets_app/Packages/Components/Toast/simple_toast.dart';
import 'package:vets_app/Packages/Components/container_background.dart';
import 'package:vets_app/Services/Authentication/auth_services.dart';
import 'package:vets_app/Services/Validators/app_validators.dart';
import 'package:vets_app/Theme/theme_status.dart';
import '../../../../Theme/app_colors.dart';
import '../../../../util/path_icons.dart';
import '../../../Components/Btn/simple_elevated_btn.dart';
import '../components/header_logo.dart';
import '../../../Components/textfield/simple_field.dart';

class PageForgot extends StatefulWidget {
  const PageForgot({super.key});
  static const String id = 'PageForgot';

  @override
  State<PageForgot> createState() => _PageForgotState();
}

class _PageForgotState extends State<PageForgot> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String? _email;
  @override
  Widget build(BuildContext context) {
    final AuthServices auth = Provider.of<AuthServices>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header Logo
            ClipPath(
              clipper: MyCustomClipper(),
              child: const BackgroundContainer(
                child: SafeArea(
                  child: HeaderLogo(title: 'Forgot Password'),
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
                    Text(
                      textAlign: TextAlign.center,
                      'Please enter your email and we will send \nyou a link to return to your account',
                      style: AppTheme.bodySmall(context: context)
                          ?.copyWith(fontSize: 16.sp, color: AppColors.gray),
                    ),
                    SizedBox(height: 20.h),
                    //* Email
                    SimpleField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: PathIcons.email,
                      validator: (value) => AppValidators.isEmail(value),
                      onSaved: (value) => _email = value,
                    ),
                    SizedBox(height: 30.h),

                    //* Button
                    Center(
                      child: auth.isLoading
                          ? const AppLoading(type: TypeLoading.button)
                          : SimpleElevatedBtn(
                              text: 'Send',
                              onTap: () async {
                                if (_keyForm.currentState!.validate()) {
                                  _keyForm.currentState?.save();
                                  bool result =
                                      await auth.resetPassword(email: _email!);
                                  if (result) {
                                    if (!mounted) return;
                                    Navigator.of(context).pop();
                                  } else {
                                    simpleToast(message: auth.errorMessage);
                                  }
                                }
                              },
                            ),
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
