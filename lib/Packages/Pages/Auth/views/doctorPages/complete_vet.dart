import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Components/time_picker.dart';
import '../../../../../Services/Authentication/auth_services.dart';
import '../../../../../Services/Authentication/profile_image.dart';
import '../../../../../Services/Authentication/send_data_vet.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Services/Validators/app_validators.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/Btn/simple_elevated_btn.dart';
import '../../../../Components/Clipper/custom_clip_path.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import '../../../../Components/Toast/simple_toast.dart';
import '../../../../Components/container_background.dart';
import '../../../../Components/textfield/simple_field.dart';
import '../../components/header_logo.dart';
import '../../components/info_vet.dart/weekday_select.dart';
import '../../models/model_vet.dart';
import '../wrapper.dart';
import '/Theme/app_colors.dart';
import '/util/path_icons.dart';
import 'package:path/path.dart' as path;

class CompleteProfileVet extends StatefulWidget {
  const CompleteProfileVet({
    super.key,
  });
  static const String id = 'CompleteProfileDoctor';

  @override
  State<CompleteProfileVet> createState() => _CompleteProfileVetState();
}

class _CompleteProfileVetState extends State<CompleteProfileVet> {
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

    return Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* description
                    SimpleField(
                      hintText: 'Description',
                      maxLines: 6,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 85.h),
                        child: PathIcons.description,
                      ),
                      validator: (value) => AppValidators.isEmpty(value),
                      onSaved: (value) => _modelVet.description = value,
                    ),
                    // //* Radio Button
                    // SimpleRadio(
                    //   onChoose: (value) {
                    //     _modelUser.type =
                    //         value == 1 ? KeyFirebase.user : KeyFirebase.vet;
                    //   },
                    // ),
                    SizedBox(height: 20.h),

                    // * Choose working days
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Text('Choose working days',
                          style: AppTheme.titleMedium(context: context)),
                    ),

                    const SelectWeekday(),
                    SizedBox(height: 20.h),

                    // * Choose working hours
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Text('Choose working hours',
                          style: AppTheme.titleMedium(context: context)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TimePickerCustom(text: 'From'),
                          SizedBox(width: 10.w),
                          PathIcons.arrowForward,
                          SizedBox(width: 10.w),
                          const TimePickerCustom(text: 'Until'),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),

                    //* Button
                    Center(
                      child: provideImage.isLoading
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
                                  // * check type user

                                  // * check image provider
                                  if (vetData.workdays == null) {
                                    simpleToast(
                                        message: 'Please select working days');
                                  } else {
                                    if (vetData.hourFrom == null ||
                                        vetData.hoursUntil == null) {
                                      simpleToast(
                                          message:
                                              'Please select working hours');
                                    } else {
                                      String pathImage = path
                                          .basename(provideImage.image!.path);
                                      String directory = 'vet/$pathImage';
                                      String urlPhoto =
                                          await provideImage.uploadImage(
                                              directory: directory,
                                              image: provideImage.image!);

                                      // * check return url
                                      if (urlPhoto.isNotEmpty) {
                                        // * Preparation user Data
                                        _modelVet.image = urlPhoto;
                                        _modelVet.type = vetData.typeUser;
                                        _modelVet.firstName = vetData.fName;
                                        _modelVet.lastName = vetData.lName;
                                        _modelVet.phone = vetData.phone;
                                        _modelVet.location = vetData.location;
                                        _modelVet.workdays = vetData.workdays;
                                        _modelVet.holidays = vetData.holidays;
                                        _modelVet.hourFrom = vetData.hourFrom;
                                        _modelVet.hoursUntil =
                                            vetData.hoursUntil;
                                        // * save in DataBase info user
                                        bool result = await auth.addInfoVet(
                                            modelVet: _modelVet);
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
                                              message:
                                                  provideImage.errorMessage);
                                        }
                                      } else {
                                        simpleToast(
                                            message: provideImage.errorMessage);
                                      }
                                    }
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
            // _modelVet.firstName = fName;
            //                     _modelVet.lastName = lName;
            //                     _modelVet.phone = phone;
            //                     _modelVet.location = location;
            //                     _modelVet.image = imageUrl;
            //                     _modelVet.type = typeUser;