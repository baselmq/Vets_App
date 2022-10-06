import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Packages/Components/Btn/simple_elevated_btn.dart';
import 'package:vets_app/Packages/Components/textfield/simple_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vets_app/Packages/Pages/Doctor/DetailsDr/models/model_rating.dart';
import 'package:vets_app/Theme/app_colors.dart';
import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Authentication/store_services.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import '../../../../Components/Toast/result_toast.dart';
import '../../../../Components/Toast/simple_toast.dart';
import '../../../../Components/cache_image/image_user.dart';
import '../../../Auth/models/model_vet.dart';
import '../components/rating/app_bar_rating.dart';
import 'package:easy_localization/easy_localization.dart';

class RateVet extends StatefulWidget {
  const RateVet({required ModelVet vet, super.key}) : _vet = vet;
  static const String id = 'RateVet';
  final ModelVet _vet;
  @override
  State<RateVet> createState() => _RateVetState();
}

class _RateVetState extends State<RateVet> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final ModelRating _modelRating = ModelRating();

  @override
  Widget build(BuildContext context) {
    GetData dataUser = Provider.of<GetData>(context);
    StoreServices store = Provider.of<StoreServices>(context);

    return Scaffold(
      appBar: AppBarRating(vet: widget._vet),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageUser(
                          imageUrl: '${dataUser.modelUser!.image}',
                          radius: 26,
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${dataUser.modelUser!.firstName} ${dataUser.modelUser!.lastName}',
                                style: AppTheme.bodyMedium(context: context)
                                    ?.copyWith(fontSize: 15)),
                            SizedBox(height: 5.h),
                            Text(KeyLang.reviewsArePublic.tr(),
                                style: AppTheme.bodyMedium(context: context)
                                    ?.copyWith(color: Colors.grey[700])),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // * rating Bar Change

              RatingBar.builder(
                glowColor: Colors.white,
                itemCount: 5,
                initialRating: 0,
                minRating: 1,
                allowHalfRating: true,
                direction: Axis.horizontal,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: AppColors.primary,
                ),
                onRatingUpdate: (value) {
                  _modelRating.rating = value;
                },
              ),
              const SizedBox(height: 30),

              //* Describe your experience
              Form(
                key: _keyForm,
                child: SimpleField(
                  hintText: KeyLang.describeYourExperience.tr(),
                  maxLength: 500,
                  maxLines: 13,
                  minLines: 1,
                  widthBorder: 2,
                  onSaved: (value) => _modelRating.describeExperience = value,
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: store.isLoading
                    ? const AppAnimationLoading(type: TypeLoading.button)
                    : SimpleElevatedBtn(
                        text: KeyLang.post.tr(),
                        minimumSize: Size(200.w, 45.w),
                        onTap: () async {
                          if (_modelRating.rating != null) {
                            _keyForm.currentState?.save();

                            _modelRating.vetId = widget._vet.id;
                            _modelRating.userId = dataUser.modelUser!.id;
                            _modelRating.imageUser = dataUser.modelUser!.image;
                            _modelRating.dateRating = DateTime.now().toString();
                            _modelRating.nameUser =
                                '${dataUser.modelUser!.firstName} ${dataUser.modelUser!.lastName}';
                            // * save in DataBase info user
                            bool result = await store.addRating(
                                modelRating: _modelRating);
                            if (result) {
                              store.setLoading = false;
                              simpleToastOk(
                                  message: KeyLang.done.tr(),
                                  gravity: ToastGravity.BOTTOM);
                              if (mounted) {
                                Navigator.pop(context);
                              }
                            } else {
                              store.setLoading = false;
                              simpleToast(message: store.errorMessage);
                            }
                          } else {
                            simpleToast(
                              message: KeyLang.pleaseRate.tr(),
                            );
                          }
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
