import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vets_app/Language/generated/key_lang.dart';
import 'package:vets_app/Services/Firestore/booking_data.dart';
import 'package:easy_localization/easy_localization.dart';

class SimpleTimePicker extends StatefulWidget {
  const SimpleTimePicker({Key? key}) : super(key: key);

  @override
  State<SimpleTimePicker> createState() => _SimpleTimePickerState();
}

class _SimpleTimePickerState extends State<SimpleTimePicker> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    final DataBooking dataBooking =
        Provider.of<DataBooking>(context, listen: false);
    return Center(
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(120.w, 32.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              if (newTime != null && newTime != selectedTime) {
                setState(() {
                  selectedTime = newTime;
                  dataBooking.setTime = selectedTime!.format(context);
                });
              }
            },
            child: Text(KeyLang.selectTime.tr()),
          ),
          SizedBox(width: 50.w),
          Text(selectedTime == null ? '' : selectedTime!.format(context)),
        ],
      ),
    );
  }
}
