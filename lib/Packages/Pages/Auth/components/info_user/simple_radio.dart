import 'package:flutter/material.dart';
import '../../../../../Theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Theme/theme_status.dart';

class SimpleRadio extends StatefulWidget {
  const SimpleRadio({
    Key? key,
    required Function(int) onChoose,
    int initRadioGroup = -1,
  })  : _onChoose = onChoose,
        _initRadioGroup = initRadioGroup,
        super(key: key);

  final int _initRadioGroup;
  final Function(int) _onChoose;

  @override
  State<SimpleRadio> createState() => _SimpleRadioState();
}

class _SimpleRadioState extends State<SimpleRadio> {
  late int _valueGroup;

  @override
  void initState() {
    super.initState();
    _valueGroup = widget._initRadioGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Radio(
                value: 1,
                groupValue: _valueGroup,
                onChanged: (int? value) {
                  setState(() {
                    _valueGroup = value!;
                  });
                  widget._onChoose(value!);
                },
                activeColor: AppColors.primary,
              ),
              title: Text('User', style: AppTheme.bodyLarge(context: context)),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Radio(
                value: 2,
                groupValue: _valueGroup,
                onChanged: (int? value) {
                  setState(() {
                    _valueGroup = value!;
                  });
                  widget._onChoose(value!);
                },
                activeColor: AppColors.primary,
              ),
              title: Text('Vet', style: AppTheme.bodyLarge(context: context)),
            ),
          ),
        ],
      ),
    );
  }
}
