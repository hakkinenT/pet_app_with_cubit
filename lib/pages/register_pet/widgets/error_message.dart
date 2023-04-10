import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, left: 10, bottom: 16.0),
      child: Text(
        message,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.red[700],
            ),
      ),
    );
  }
}
