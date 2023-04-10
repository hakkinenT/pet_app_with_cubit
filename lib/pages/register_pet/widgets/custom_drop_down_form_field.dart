import 'package:flutter/material.dart';
import 'package:pet_app_with_cubit/data/models/type_animal.dart';

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
      child: DropdownButtonFormField<TypeAnimal>(
        value: value,
        hint: hintText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        decoration: InputDecoration(
            errorText: errorText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            contentPadding: const EdgeInsets.all(16)),
        items: items,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}