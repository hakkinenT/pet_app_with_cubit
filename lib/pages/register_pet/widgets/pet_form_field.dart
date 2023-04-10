import 'package:flutter/material.dart';

import 'form_label.dart';

class PetFormField extends StatelessWidget {
  const PetFormField({super.key, required this.label, required this.field});
  final String label;
  final List<Widget> field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(label: label),
        labelSpacing,
        ...field,
      ],
    );
  }

  final SizedBox labelSpacing = const SizedBox(
    height: 8,
  );
}
