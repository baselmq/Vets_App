import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Pages/Doctor/Home/components/no_booking.dart';
import '../../../../../Services/Authentication/store_services.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';
import 'change_current_booking.dart';

class BookingVet extends StatefulWidget {
  const BookingVet({super.key});

  @override
  State<BookingVet> createState() => _BookingVetState();
}

class _BookingVetState extends State<BookingVet> {
  int currentBooking = 0;

  @override
  Widget build(BuildContext context) {
    StoreServices store = Provider.of<StoreServices>(context, listen: false);

    return StreamBuilder(
        stream: StoreServices().getListBookingsForVet(store.userData.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AppAnimationLoading(type: TypeLoading.page),
            );
          }
          if (snapshot.data!.isNotEmpty) {
            return ChangeCurrentBooking(
                length: snapshot.data!.length, snapshot: snapshot);
          } else {
            return const CardNoBooking();
          }
        });
  }

  // Container buildDot({int? index}) {
  //   return Container(
  //     height: 6,
  //     width: ChangeIndexPage.index == index ? 20 : 6,
  //     margin: const EdgeInsets.only(right: 5),
  //     decoration: BoxDecoration(
  //       color: currentBooking == index ? AppColors.primary : AppColors.gray,
  //       borderRadius: BorderRadius.circular(3),
  //     ),
  //   );
  // }
}
