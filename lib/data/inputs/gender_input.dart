import '../../validator/form_input.dart';
import '../enum/gender.dart';

class GenderInput extends FormInput<Gender, String> {
  const GenderInput({required super.value});

  @override
  String? validator() {
    if (value.isEmpty) return "Informe um gênero";

    return null;
  }
}
