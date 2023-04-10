import 'package:flutter/material.dart';

class ExpansionTileContentItem extends StatelessWidget {
  const ExpansionTileContentItem({
    super.key,
    required this.label,
    required this.description,
  });

  final String description;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15),
        ),
        const Spacer(),
        Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}
