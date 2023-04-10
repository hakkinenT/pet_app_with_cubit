import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.onPressed, required this.child});

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
