import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ThemeApp {
  ThemeApp._();

  static final lightTheme = lightThemeData();
}

ThemeData lightThemeData() {
  return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        // contentPadding: EdgeInsets.symmetric(vertical: 17.5),
        // fillColor: Colors.black,

        errorStyle: TextStyle(
          color: Colors.red,
          fontFamily: 'myriad_regular',
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'myriad_regular',
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        filled: true,
      ),
      );
}
