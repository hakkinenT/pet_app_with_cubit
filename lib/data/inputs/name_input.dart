import '../../validator/form_input.dart';

class NameInput extends FormInput<String, String> {
  const NameInput({required super.value});

  @override
  String? validator() {
    if (value.isEmpty) {
      return "Informe um nome";
    } else if (value.length < 4) {
      return "Informe um nome válido";
    }

    return null;
  }
}
