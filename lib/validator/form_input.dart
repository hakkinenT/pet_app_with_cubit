abstract class FormInput<T, E> {
  final T value;

  const FormInput({required this.value});

  bool get isValid => validator() == null;

  bool get isInvalid => !isValid;

  E? get error => validator();

  E? validator();
}
