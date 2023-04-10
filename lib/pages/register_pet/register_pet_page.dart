import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_app_with_cubit/cubit/form_validation_cubit.dart';
import 'package:pet_app_with_cubit/pages/register_pet/widgets/type_animal_drop_down.dart';

import '../../data/enum/gender.dart';
import 'widgets/custom_drop_down_form_field.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/error_message.dart';
import 'widgets/form_label.dart';
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
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                const SnackBar(
                  content: Text("Pet adicionado com sucesso"),
                ),
              );
            Navigator.pop(context);
          } else if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                const SnackBar(
                  content: Text("Houve um erro"),
                ),
              );
            Navigator.pop(context);
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
                    AgeSlider(),
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

class AgeSlider extends StatelessWidget {
  const AgeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FormValidationCubit>(context);

    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Slider(
              value: state.ageInput.value,
              max: 40,
              divisions: 40,
              label: state.ageInput.value.round().toString(),
              onChanged: cubit.onAgeChanged,
            ),
            if (state.hasError && state.ageInput.error != null)
              ErrorMessage(message: state.ageInput.error!)
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<Gender>(
                title: const Text("Fêmea"),
                value: Gender.female,
                groupValue: state.genderInput.value,
                onChanged: (gender) {
                  if (gender != null) cubit.onGenderChanged(gender);
                }),
            RadioListTile<Gender>(
                title: const Text("Macho"),
                value: Gender.male,
                groupValue: state.genderInput.value,
                onChanged: (gender) {
                  if (gender != null) cubit.onGenderChanged(gender);
                }),
            if (state.hasError && state.genderInput.error != null)
              ErrorMessage(message: state.genderInput.error!)
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
