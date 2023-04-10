import 'package:flutter/material.dart';

import '../../../data/models/type_animal.dart';

class CustomDropdownFormField extends StatelessWidget {
  const CustomDropdownFormField({
    super.key,
    this.hintText,
    this.value,
    this.focusNode,
    this.errorText,
    this.items,
    this.validator,
    this.onChanged,
  });

  final Widget? hintText;
  final TypeAnimal? value;
  final FocusNode? focusNode;
  final String? errorText;
  final List<DropdownMenuItem<TypeAnimal>>? items;
  final String? Function(TypeAnimal?)? validator;
  final ValueChanged<TypeAnimal?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 52, maxHeight: 75),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<TypeAnimal>(
        value: value,
        hint: hintText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        decoration: InputDecoration(
          errorText: errorText,
        ),
        items: items,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
