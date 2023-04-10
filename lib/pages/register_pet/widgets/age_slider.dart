import 'package:flutter/material.dart';

class AgeSlider extends StatelessWidget {
  const AgeSlider({
    super.key,
    required this.value,
    required this.label,
    this.onChanged,
  });

  final double value;
  final double label;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: Slider(
        value: value,
        max: 40,
        divisions: 40,
        label: value.round().toString(),
        onChanged: onChanged,
      ),
    );
  }
}
