import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app_with_cubit/utils/constants/constants.dart';

import '../../../data/models/pet.dart';
import 'pet_age_info.dart';
import 'pet_gender_info.dart';
import 'pet_type_info.dart';

class PetItem extends StatelessWidget {
  const PetItem({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          pet.type.imageUrl,
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(pet.name),
      childrenPadding: const EdgeInsets.all(16),
      children: [
        PetAgeInfo(age: pet.age.round()),
        const SizedBox(
          height: 8,
        ),
        PetGenderInfo(gender: pet.gender),
        const SizedBox(
          height: 8,
        ),
        PetTypeInfo(petType: pet.type.animal),
      ],
    );
  }
}
