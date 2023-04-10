import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_app_with_cubit/cubit/form_validation_cubit.dart';
import 'package:pet_app_with_cubit/pages/register_pet/widgets/type_animal_drop_down.dart';

import '../../data/enum/gender.dart';
import 'widgets/age_slider.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/error_message.dart';
import 'widgets/female_option.dart';
import 'widgets/male_option.dart';
import 'widgets/pet_form_field.dart';

class RegisterPetPage extends StatelessWidget {
  const RegisterPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<FormValidationCubit>(context),
      child: const RegisterPetView(),
    );
  }
}

class RegisterPetView extends StatefulWidget {
  const RegisterPetView({super.key});

  @override
  State<RegisterPetView> createState() => _RegisterPetViewState();
}

class _RegisterPetViewState extends State<RegisterPetView> {
  late FormValidationCubit formValidationCubit;

  @override
  void initState() {
    super.initState();
    formValidationCubit =
        BlocProvider.of<FormValidationCubit>(context, listen: false);
  }

  @override
  void dispose() {
    formValidationCubit.clearFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Animal"),
      ),
      body: BlocListener<FormValidationCubit, FormValidationState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            _showSnackBar(context, "Pet adicionado com sucesso!", Colors.green);
          } else if (state.status.isFailure) {
            _showSnackBar(
                context, "Houve um erro ao adicionar o Pet!", Colors.red);
          }
        },
        child: GestureDetector(
          onPanDown: (event) {
            formValidationCubit.checkFormError();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PetFormField(
                  label: "Nome",
                  field: [
                    NameField(),
                  ],
                ),
                fieldSpacing,
                const PetFormField(
                  label: "Idade",
                  field: [
                    AgeField(),
                  ],
                ),
                fieldSpacing,
                const PetFormField(
                  label: "Gênero",
                  field: [
                    GenderOption(),
                  ],
                ),
                fieldSpacing,
                const PetFormField(
                  label: "Tipo de Animal",
                  field: [
                    TypeAnimalField(),
                  ],
                ),
                fieldSpacing,
                const RegisterButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  final SizedBox fieldSpacing = const SizedBox(
    height: 16,
  );

  _showSnackBar(BuildContext context, String message,
      [Color? backgroundColor]) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );
    Navigator.pop(context);
  }
}

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FormValidationCubit>(context);

    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return CustomTextFormField(
          hintText: "Totó",
          onTapOutside: (value) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          errorText: state.hasError && state.nameInput.error != null
              ? state.nameInput.error
              : null,
          textInputAction: TextInputAction.next,
          onChanged: cubit.onNameChanged,
          validator: (_) => state.nameInput.validator(),
        );
      },
    );
  }
}

class AgeField extends StatelessWidget {
  const AgeField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FormValidationCubit>(context);

    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        final ageInput = state.ageInput;
        final age = ageInput.value;
        final hasError = state.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AgeSlider(
              value: age,
              label: age,
              onChanged: cubit.onAgeChanged,
            ),
            if (hasError && ageInput.error != null)
              ErrorMessage(message: ageInput.error!)
          ],
        );
      },
    );
  }
}

class GenderOption extends StatelessWidget {
  const GenderOption({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FormValidationCubit>(context);

    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        final genderInput = state.genderInput;
        final groupValue = genderInput.value;
        final hasError = state.hasError;

        genderChanged(Gender? gender) {
          if (gender != null) cubit.onGenderChanged(gender);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FemaleOption(
              groupValue: groupValue,
              onChanged: genderChanged,
            ),
            MaleOption(
              groupValue: groupValue,
              onChanged: genderChanged,
            ),
            if (hasError && genderInput.error != null)
              ErrorMessage(message: genderInput.error!)
          ],
        );
      },
    );
  }
}

class TypeAnimalField extends StatelessWidget {
  const TypeAnimalField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FormValidationCubit>(context);

    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return TypeAnimalDropdown(
          value: state.typeAnimal,
          onChanged: (petType) {
            if (petType != null) cubit.onPetTypeChanged(petType);
          },
        );
      },
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FormValidationCubit>(context);

    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return CustomElevatedButton(
          onPressed: state.status.isValidated
              ? () {
                  cubit.savePet();
                }
              : null,
          child: state.status.isInProgress
              ? const CircularProgressIndicator()
              : const Text("Cadastrar"),
        );
      },
    );
  }
}
