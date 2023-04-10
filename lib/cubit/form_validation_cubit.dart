import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_app_with_cubit/data/enum/gender.dart';

import 'package:pet_app_with_cubit/data/inputs/age_input.dart';
import 'package:pet_app_with_cubit/data/inputs/gender_input.dart';
import 'package:pet_app_with_cubit/data/inputs/name_input.dart';
import 'package:pet_app_with_cubit/data/inputs/pet_type_input.dart';
import 'package:pet_app_with_cubit/validator/enum/form_status.dart';
import 'package:pet_app_with_cubit/validator/form_validator.dart';

import '../data/models/pet.dart';
import '../data/models/type_animal.dart';

part 'form_validation_state.dart';

class FormValidationCubit extends Cubit<FormValidationState> {
  FormValidationCubit()
      : pets = [],
        super(const FormValidationState(pets: []));

  final List<Pet> pets;

  void onNameChanged(String name) {
    final nameInput = NameInput(value: name);

    emit(
      state.copyWith(
        nameInput: nameInput,
        status: FormValidator.validate(
          inputs: [
            nameInput,
            state.ageInput,
            state.genderInput,
          ],
        ),
      ),
    );
  }

  void onAgeChanged(double age) {
    final ageInput = AgeInput(value: age);
    emit(
      state.copyWith(
        ageInput: ageInput,
        status: FormValidator.validate(
          inputs: [
            state.nameInput,
            ageInput,
            state.genderInput,
          ],
        ),
      ),
    );
  }

  void onGenderChanged(Gender gender) {
    final genderInput = GenderInput(value: gender);
    emit(
      state.copyWith(
        genderInput: genderInput,
        status: FormValidator.validate(
          inputs: [
            state.nameInput,
            state.ageInput,
            genderInput,
          ],
        ),
      ),
    );
  }

  void onPetTypeChanged(TypeAnimal typeAnimal) {
    emit(
      state.copyWith(
        typeAnimal: typeAnimal,
      ),
    );
  }

  void filterPets(String filter) {
    emit(
      state.copyWith(
        pets: pets
            .where(
              (pet) => pet.name.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList(),
      ),
    );
  }

  void clearFields() {
    emit(
      state.copyWith(
          ageInput: const AgeInput(value: 0),
          genderInput: const GenderInput(value: Gender.empty),
          hasError: false),
    );
  }

  void checkFormError() {
    if (state.status.isInvalid) {
      emit(state.copyWith(hasError: true));
    } else {
      emit(state.copyWith(hasError: false));
    }
  }

  void savePet() {
    if (!state.status.isValidated) return;

    final pet = Pet(
      name: state.nameInput.value,
      age: state.ageInput.value,
      gender: state.genderInput.value,
      type: state.typeAnimal,
    );

    try {
      emit(state.copyWith(status: FormStatus.inProgress));

      pets.add(pet);

      emit(
        state.copyWith(
          pets: pets,
        ),
      );

      emit(state.copyWith(status: FormStatus.success));
    } on Exception {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }
}
