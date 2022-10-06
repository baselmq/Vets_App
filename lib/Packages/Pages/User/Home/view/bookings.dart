import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Packages/Pages/User/Home/components/card_booking.dart';
import '../../../../../Services/Authentication/get_data.dart';
import '../../../../../Services/Authentication/store_services.dart';
import '../../../../Components/Loading/enum_loading.dart';
import '../../../../Components/Loading/loading_animation.dart';

class BookingUser extends StatefulWidget {
  const BookingUser({Key? key}) : super(key: key);

  @override
  State<BookingUser> createState() => _BookingUserState();
}

class _BookingUserState extends State<BookingUser> {
  String formatDate(String selectedDate, String pattern) {
    DateFormat format = DateFormat(pattern);

    String formatted = format.format(DateTime.parse(selectedDate));
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    GetData getData = Provider.of<GetData>(context, listen: false);

    return StreamBuilder(
        stream: StoreServices().getBookingUser(StoreServices().userData.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AppAnimationLoading(type: TypeLoading.page),
            );
          }

          if (snapshot.hasData) {
            getData.setModelBooking = snapshot.data;
            var data = getData.modelBooking;
            return ShowDataBooking(
              idDoc: data!.id!,
              idVet: data.vetId!,
              idUser: data.userId!,
              time: data.timeBooking!,
              date: data.dateBooking!,
            );
            // * Searching for user data

          } else {
            return Container(width: 0);
          }
        });
  }
}

class ShowDataBooking extends StatefulWidget {
  const ShowDataBooking(
      {Key? key,
      required this.idDoc,
      required this.idUser,
      required this.idVet,
      required this.time,
      required this.date})
      : super(key: key);
  final String idDoc;
  final String idUser;
  final String idVet;
  final String time;
  final String date;

  @override
  State<ShowDataBooking> createState() => _ShowDataBookingState();
}

class _ShowDataBookingState extends State<ShowDataBooking> {
  String formatDate(String selectedDate, String pattern) {
    DateFormat format = DateFormat(pattern);

    String formatted = format.format(DateTime.parse(selectedDate));
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    GetData getData = Provider.of<GetData>(context, listen: false);

    return StreamBuilder(
      stream: StoreServices().getVetDetails(widget.idVet),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: AppAnimationLoading(type: TypeLoading.page),
          );
        }
        if (snapshot.hasData) {
          getData.setModelVet = snapshot.data;
          var data = getData.modelVet;
          return CardBookingUser(
              imageUrl: data!.image!,
              name: data.firstName!,
              subText: 'subText',
              bookingTime: widget.time,
              bookingDate: formatDate(widget.date, 'MMMd'));
        } else {
          return Container(width: 0);
        }
      },
    );
  }
}
