import 'package:flutter/material.dart';

import '../../../data/enum/gender.dart';

class MaleOption extends StatelessWidget {
  const MaleOption({
    super.key,
    this.groupValue,
    this.onChanged,
  });

  final Gender? groupValue;
  final ValueChanged<Gender?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Gender>(
        title: const Text("Macho"),
        value: Gender.male,
        groupValue: groupValue,
        onChanged: onChanged);
  }
}
