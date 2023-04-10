import 'package:flutter/material.dart';

class PetTheme {
  static final light = _lightTheme.copyWith(
    appBarTheme: _appBarTheme,
    colorScheme: _colorScheme,
    sliderTheme: _sliderTheme,
    iconTheme: _iconTheme,
    inputDecorationTheme: _inputDecorationTheme,
    scaffoldBackgroundColor: Colors.white,
    expansionTileTheme: _expansionTileTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonTheme),
  );

  static final _lightTheme = ThemeData.light();

  static final _colorScheme =
      _lightTheme.colorScheme.copyWith(secondary: Colors.orange);

  static final _appBarTheme = _lightTheme.appBarTheme.copyWith(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    iconTheme: _iconTheme,
  );

  static final _iconTheme = _lightTheme.iconTheme.copyWith(color: Colors.black);

  static final _sliderTheme = _lightTheme.sliderTheme.copyWith(
    thumbColor: Colors.orange,
    activeTrackColor: Colors.orange,
    inactiveTrackColor: Colors.orange.shade100,
    activeTickMarkColor: Colors.black26,
    inactiveTickMarkColor: Colors.deepOrange,
    valueIndicatorColor: Colors.orange.shade400,
    valueIndicatorTextStyle: const TextStyle(color: Colors.black),
  );

  static final _inputDecorationTheme =
      _lightTheme.inputDecorationTheme.copyWith(
          border: _outlineInputBorder(Colors.orange),
          focusedBorder: _outlineInputBorder(
            Colors.orange.shade200,
          ),
          enabledBorder: _outlineInputBorder(Colors.orange),
          hintStyle: const TextStyle(color: Colors.black38),
          contentPadding: const EdgeInsets.all(16));

  static OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color));
  }

  static final _expansionTileTheme = _lightTheme.expansionTileTheme.copyWith(
      collapsedIconColor: Colors.black,
      collapsedTextColor: Colors.black,
      iconColor: Colors.orange,
      textColor: Colors.orange);

  static final _elevatedButtonTheme = ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}
