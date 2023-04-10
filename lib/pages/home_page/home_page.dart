import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/form_validation_cubit.dart';
import '../register_pet/register_pet_page.dart';
import '../register_pet/widgets/custom_text_form_field.dart';
import 'widgets/pet_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchFormField(),
            SizedBox(
              height: 16,
            ),
            Expanded(child: PetList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const RegisterPetPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<FormValidationCubit, FormValidationState>(
        builder: (context, state) {
          return CustomTextFormField(
            onChanged: BlocProvider.of<FormValidationCubit>(context).filterPets,
            hintText: "Pesquisar...",
          );
        },
      ),
    );
  }
}

class PetList extends StatelessWidget {
  const PetList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: BlocBuilder<FormValidationCubit, FormValidationState>(
        builder: (context, state) {
          if (state.pets.isNotEmpty) {
            final pets = state.pets;
            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return PetItem(pet: pets[index]);
              },
            );
          }

          return const EmptyList();
        },
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("A lista está vazia"),
    );
  }
}
