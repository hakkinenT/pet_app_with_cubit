part of 'form_validation_cubit.dart';

class FormValidationState extends Equatable {
  final NameInput nameInput;
  final AgeInput ageInput;
  final GenderInput genderInput;
  final TypeAnimal typeAnimal;
  final FormStatus status;
  final List<Pet> pets;
  final bool hasError;

  const FormValidationState({
    this.nameInput = const NameInput(value: ""),
    this.ageInput = const AgeInput(value: 0),
    this.genderInput = const GenderInput(value: Gender.empty),
    this.typeAnimal = const TypeAnimal(),
    this.status = FormStatus.initial,
    this.hasError = false,
    required this.pets,
  });

  FormValidationState copyWith({
    NameInput? nameInput,
    AgeInput? ageInput,
    GenderInput? genderInput,
    TypeAnimal? typeAnimal,
    FormStatus? status,
    List<Pet>? pets,
    bool? hasError,
  }) {
    return FormValidationState(
        nameInput: nameInput ?? this.nameInput,
        ageInput: ageInput ?? this.ageInput,
        genderInput: genderInput ?? this.genderInput,
        typeAnimal: typeAnimal ?? this.typeAnimal,
        status: status ?? this.status,
        pets: pets ?? this.pets,
        hasError: hasError ?? this.hasError);
  }

  @override
  List<Object?> get props =>
      [nameInput, ageInput, genderInput, typeAnimal, status, pets, hasError];
}
