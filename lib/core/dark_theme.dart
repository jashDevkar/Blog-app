import 'package:blog_app/core/pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: color),
      );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: AppBarTheme(color: Pallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(18.0),
      enabledBorder: _border(Pallete.inputBorder),
      focusedBorder: _border(Pallete.whiteColor),
      errorBorder: _border(Pallete.redColor),
      focusedErrorBorder: _border(Pallete.redColor),
      floatingLabelStyle: TextStyle(color: Pallete.whiteColor),
      errorStyle: TextStyle(color: Colors.red),
    ),
  );
}
