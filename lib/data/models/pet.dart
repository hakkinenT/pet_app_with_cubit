import 'package:equatable/equatable.dart';
import 'package:pet_app_with_cubit/data/models/type_animal.dart';

import '../enum/gender.dart';

class Pet extends Equatable {
  final String name;
  final double age;
  final Gender gender;
  final TypeAnimal type;

  const Pet(
      {required this.name,
      required this.age,
      required this.gender,
      required this.type});

  @override
  List<Object?> get props => [name, age, gender, type];
}
