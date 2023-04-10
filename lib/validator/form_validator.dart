import 'enum/form_status.dart';
import 'form_input.dart';

class FormValidator {
  static FormStatus validate(
      {required List<FormInput<dynamic, dynamic>> inputs}) {
    final isValid = inputs.every((input) => input.isValid);

    if (isValid) {
      return FormStatus.validated;
    } else {
      return FormStatus.invalid;
    }
  }
}
