import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app_with_cubit/pages/register_pet/widgets/custom_drop_down_form_field.dart';

import '../../../data/constants/pet_type_data.dart';
import '../../../data/models/type_animal.dart';

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
    petTypeData.length,
    (index) => DropdownMenuItem<TypeAnimal>(
      value: petTypeData[index],
      child: Text(petTypeData[index].animal),
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
