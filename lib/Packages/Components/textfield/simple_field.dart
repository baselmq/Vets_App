import 'package:flutter/material.dart';
import 'package:vets_app/Theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleField extends StatelessWidget {
  const SimpleField({
    super.key,
    String? initialValue,
    TextInputType? keyboardType = TextInputType.text,
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    FocusNode? focusNode,
    TextEditingController? controller,
    void Function()? onSIcon,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    bool? isObscureText,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    double? widthBorder,
    EdgeInsetsGeometry? contentPadding,
  })  : _initialValue = initialValue,
        _keyboardType = keyboardType,
        _isObscureText = isObscureText,
        _hintText = hintText,
        _labelText = labelText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _onSuffixIcon = onSIcon,
        _focusNode = focusNode,
        _controller = controller,
        _onChanged = onChanged,
        _validator = validator,
        _onSaved = onSaved,
        _maxLines = maxLines,
        _minLines = minLines,
        _maxLength = maxLength,
        _widthBorder = widthBorder,
        _contentPadding = contentPadding;

  final String? _initialValue;
  final TextInputType? _keyboardType;
  final bool? _isObscureText;
  final String? _hintText;
  final String? _labelText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final FocusNode? _focusNode;

  final TextEditingController? _controller;
  final void Function()? _onSuffixIcon;
  final void Function(String)? _onChanged;
  final String? Function(String?)? _validator;
  final void Function(String?)? _onSaved;
  final int? _maxLines;
  final int? _minLines;
  final int? _maxLength;
  final double? _widthBorder;
  final EdgeInsetsGeometry? _contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _controller,
      initialValue: _initialValue,
      keyboardType: _keyboardType,
      cursorColor: AppColors.primary,
      obscureText: _isObscureText ?? false,
      minLines: _minLines,
      maxLines: _maxLines,
      maxLength: _maxLength,
      onChanged: _onChanged,
      validator: _validator,
      onSaved: _onSaved,
      decoration: InputDecoration(
        contentPadding: _contentPadding,
        isDense: true,
        border: InputBorder.none,
        labelText: _labelText,
        hintText: _hintText,
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon != null
            ? InkWell(
                borderRadius: BorderRadius.circular(13.r),
                onTap: _onSuffixIcon,
                child: _suffixIcon,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide:
              BorderSide(color: AppColors.gray, width: _widthBorder ?? 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide:
              BorderSide(color: AppColors.primary, width: _widthBorder ?? 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
