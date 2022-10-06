import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../Theme/app_colors.dart';
import '../../../../Theme/theme_status.dart';

class RichTextAuth extends StatelessWidget {
  const RichTextAuth({
    Key? key,
    required String firstWord,
    required String secondWord,
    required Function() onTap,
  })  : _firstWord = firstWord,
        _secondWord = secondWord,
        _onTap = onTap,
        super(key: key);

  final String _firstWord;
  final String _secondWord;
  final Function() _onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _firstWord,
            style: AppTheme.bodyMedium(context: context)?.copyWith(
              color: AppTheme.getTheme(context: context)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          TextSpan(
            text: _secondWord,
            style: AppTheme.bodyMedium(context: context)?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTap,
          )
        ],
      ),
    );
  }
}
