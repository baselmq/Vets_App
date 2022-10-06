import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Services/Firestore/booking_data.dart';
import 'package:easy_localization/easy_localization.dart';
class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  DateTime? selectedDate;
  String? formatted;

  String? formatDate(DateTime selectedDate, String pattern) {
    DateFormat format = DateFormat(pattern);
    formatted = format.format(selectedDate);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    DataBooking dataBooking = Provider.of<DataBooking>(context, listen: false);
    return Row(
      children: [
        ElevatedButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime(2100),
            );
            if (newDate != null && newDate != selectedDate) {
              setState(() {
                selectedDate = newDate;
                dataBooking.setDate = selectedDate.toString();
              });
            }
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(120.w, 32.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r))),
          child:  Text(KeyLang.selectADate.tr()),
        ),
        SizedBox(width: 50.w),
        Text(
          selectedDate == null ? '' : formatDate(selectedDate!, 'dd/MM/yyyy')!,
        ),
      ],
    );
  }
}
