import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Services/Authentication/store_services.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Theme/change_theme.dart';
import '../../../../../Theme/app_colors.dart';
import '../../../../../Theme/theme_status.dart';
import '../../../../../util/path_icons.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import '../../ChoiceDoctor/view/doctor_choice.dart';
import '../components/card_my_vets.dart';

class MyVets extends StatelessWidget {
  const MyVets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreServices store = Provider.of<StoreServices>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            KeyLang.myVets.tr(),
            style: AppTheme.bodyMedium(context: context)
                ?.copyWith(color: AppColors.gray),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
            height: 88.h,
            child: StreamBuilder(
              stream: StoreServices().getListFavorite(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: AppAnimationLoading(type: TypeLoading.page),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final snap = snapshot.data![index];
                        if (snap.userId == store.userData.uid) {
                          String idVet = snapshot.data![index].vetId!;
                          String boolFavorite = snapshot.data![index].favorite!;
                          bool favorite = boolFavorite.toLowerCase() != "false";
                          if (snapshot.data!.length == 1) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: ShowMyVets(
                                idVet: idVet,
                                favorite: favorite,
                                width: 318,
                              ),
                            );
                          } else {
                            return Row(
                              children: [
                                SizedBox(width: 10.w),
                                Padding(
                                    padding: index == snapshot.data!.length - 1
                                        ? EdgeInsets.only(right: 10.w)
                                        : const EdgeInsets.only(right: 0),
                                    child: ShowMyVets(
                                      idVet: idVet,
                                      favorite: favorite,
                                    )),
                              ],
                            );
                          }
                        } else {
                          return Container(width: 0);
                        }
                      },
                    );
                  } else {
                    return const Center(
                      child: AddFavorite(),
                    );
                  }
                } else {
                  return Container(width: 0);
                }
              },
            )),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class ShowMyVets extends StatelessWidget {
  const ShowMyVets(
      {super.key,
      required this.idVet,
      required this.favorite,
      this.width = 285});
  final String idVet;
  final bool favorite;
  final double width;

  @override
  Widget build(BuildContext context) {
    GetData getData = Provider.of<GetData>(context, listen: false);

    return StreamBuilder(
      stream: StoreServices().getVet(idVet),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: AppAnimationLoading(type: TypeLoading.page),
          );
        }
        if (snapshot.hasData) {
          getData.setModelVet = snapshot.data;
          var data = getData.modelVet;
          return CardMyVets(
            vet: data!,
            isFavorite: favorite,
            width: width,
          );
        } else {
          return Container(width: 0);
        }
      },
    );
  }
}

class AddFavorite extends StatelessWidget {
  const AddFavorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangeThemes themes = Provider.of<ChangeThemes>(context, listen: false);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: themes.isDark ? AppColors.darkLight : AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageDoctorChoice.id);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.white,
                shape: const CircleBorder(),
              ),
              child: SvgPicture.asset(
                PathIcons.add,
                width: 15.w,
                color: AppColors.greyIconAdd,
              ),
            ),
            Text(KeyLang.addFavorite.tr(),
                style: AppTheme.bodySmall(context: context))
          ],
        ),
      ),
    );
  }
}
