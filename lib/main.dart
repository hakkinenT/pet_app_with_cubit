import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_app_with_cubit/cubit/form_validation_cubit.dart';
import 'package:pet_app_with_cubit/pages/home_page/home_page.dart';

import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidationCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: PetTheme.light,
        home: const HomePage(),
      ),
    );
  }
}
