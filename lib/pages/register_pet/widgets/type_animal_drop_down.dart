import 'package:flutter/material.dart';

import '../../../data/constants/type_animal_data.dart';
import '../../../data/models/type_animal.dart';
import 'custom_drop_down_form_field.dart';

class TypeAnimalDropdown extends StatefulWidget {
  final TypeAnimal? value;
  final FocusNode? focusNode;
  final String? errorText;
  final String? Function(TypeAnimal?)? validator;
  final ValueChanged<TypeAnimal?>? onChanged;

  const TypeAnimalDropdown(
      {super.key,
      this.focusNode,
      this.errorText,
      this.validator,
      this.onChanged,
      this.value});

  @override
  State<TypeAnimalDropdown> createState() => _TypeAnimalDropdownState();
}

class _TypeAnimalDropdownState extends State<TypeAnimalDropdown> {
  final items = List<DropdownMenuItem<TypeAnimal>>.generate(
    typeAnimalData.length,
    (index) => DropdownMenuItem<TypeAnimal>(
      value: typeAnimalData[index],
      child: Text(typeAnimalData[index].animal),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomDropdownFormField(
      value: widget.value,
      items: items,
      onChanged: widget.onChanged,
      validator: widget.validator,
      focusNode: widget.focusNode,
      errorText: widget.errorText,
    );
  }
}
