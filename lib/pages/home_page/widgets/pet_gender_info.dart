import 'package:flutter/material.dart';

import '../../../data/enum/gender.dart';
import 'expansion_tile_content_item.dart';

class PetGenderInfo extends StatelessWidget {
  const PetGenderInfo({
    super.key,
    required this.gender,
  });

  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileContentItem(
      label: "Gênero",
      description: gender.value,
    );
  }
}
