import 'package:flutter/material.dart';
import '../../../../../Theme/app_colors.dart';

import '../../../../../Theme/theme_status.dart';

class SimpleRadioSetting extends StatelessWidget {
  const SimpleRadioSetting({
    Key? key,
    required void Function(int?)? onChanged,
    required int valueGroup,
    required this.textOne,
    required this.textTwo,
  })  : _onChanged = onChanged,
        _valueGroup = valueGroup,
        super(key: key);

  final int _valueGroup;
  final void Function(int?)? _onChanged;
  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Radio(
              value: 1,
              groupValue: _valueGroup,
              onChanged: _onChanged,
              activeColor: AppColors.primary,
            ),
            title: Text(textOne, style: AppTheme.bodyLarge(context: context)),
          ),
        ),
        Expanded(
          child: ListTile(
            leading: Radio(
              value: 2,
              groupValue: _valueGroup,
              onChanged: _onChanged,
              activeColor: AppColors.primary,
            ),
            title: Text(textTwo, style: AppTheme.bodyLarge(context: context)),
          ),
        ),
      ],
    );
  }
}
