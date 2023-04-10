import 'package:flutter/material.dart';

import 'expansion_tile_content_item.dart';

class PetTypeInfo extends StatelessWidget {
  const PetTypeInfo({
    super.key,
    required this.petType,
  });

  final String petType;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileContentItem(
      label: "Tipo de animal",
      description: petType,
    );
  }
}
