import '../../validator/form_input.dart';

class AgeInput extends FormInput<double, String> {
  const AgeInput({required super.value});

  @override
  String? validator() {
    if (value == 0.0) return "Informe uma idade";

    return null;
  }
}
