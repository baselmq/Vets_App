import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Services/Authentication/send_data_vet.dart';

class TimePickerCustom extends StatefulWidget {
  const TimePickerCustom({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<TimePickerCustom> createState() => _TimePickerCustomState();
}

class _TimePickerCustomState extends State<TimePickerCustom> {
  TimeOfDay? selectedTime;

  // Future<void> displayTimeDialog() async {
  //   TimeOfDay? newTime =
  //       await showTimePicker(context: context, initialTime: TimeOfDay.now());

  //   if (newTime != null && newTime != selectedTime) {
  //     setState(() {
  //       selectedTime = newTime;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final VetData vetData = Provider.of<VetData>(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              if (newTime != null && newTime != selectedTime) {
                setState(() {
                  selectedTime = newTime;
                  if (widget.text == 'From') {
                    vetData.setHoursFrom = selectedTime!.format(context);
                  } else {
                    vetData.setHoursUntil = selectedTime!.format(context);
                  }
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(120.w, 40.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              selectedTime == null
                  ? widget.text
                  : selectedTime!.format(context),
            ),
          )
        ],
      ),
    );
  }
}
