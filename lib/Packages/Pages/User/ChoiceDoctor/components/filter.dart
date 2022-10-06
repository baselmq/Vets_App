import 'package:flutter/material.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:vets_app/Theme/theme_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/path_icons.dart';

const List<String> list = <String>['All', 'Amman', 'Zarqa', 'Irbid', 'Mafraq'];

class FilterLocation extends StatefulWidget {
  const FilterLocation({super.key});

  @override
  State<FilterLocation> createState() => _FilterLocationState();
}

class _FilterLocationState extends State<FilterLocation> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: PathIcons.filter,
      ),
      elevation: 16,
      style: AppTheme.bodyMedium(context: context)
          ?.copyWith(color: AppColors.primary),
      underline: Container(
        height: 0,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
