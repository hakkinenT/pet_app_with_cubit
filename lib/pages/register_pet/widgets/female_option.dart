import 'package:flutter/material.dart';

import '../../../data/enum/gender.dart';

class FemaleOption extends StatelessWidget {
  const FemaleOption({
    super.key,
    this.groupValue,
    this.onChanged,
  });

  final Gender? groupValue;
  final ValueChanged<Gender?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Gender>(
        title: const Text("Fêmea"),
        value: Gender.female,
        groupValue: groupValue,
        onChanged: onChanged);
  }
}
