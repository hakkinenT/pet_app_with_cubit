import 'package:pet_app_with_cubit/data/models/type_animal.dart';
import 'package:pet_app_with_cubit/validator/form_input.dart';

class PetTypeInput extends FormInput<TypeAnimal, String> {
  const PetTypeInput({required super.value});

  @override
  String? validator() {
    if (value.animal.isEmpty) return "Campo obrigatório";

    print("não passei na validação");
    return null;
  }
}
