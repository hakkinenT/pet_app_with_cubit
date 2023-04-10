import 'package:flutter/material.dart';

import 'expansion_tile_content_item.dart';

class PetAgeInfo extends StatelessWidget {
  const PetAgeInfo({
    super.key,
    required this.age,
  });

  final int age;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileContentItem(
      label: "Idade",
      description: '$age',
    );
  }
}
