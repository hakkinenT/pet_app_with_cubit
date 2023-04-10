import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.textInputAction,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.errorText,
    this.autofocus = false,
  });

  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final ValueChanged<PointerDownEvent>? onTapOutside;
  final ValueChanged<String>? onFieldSubmitted;
  final String? errorText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autofocus: autofocus,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
