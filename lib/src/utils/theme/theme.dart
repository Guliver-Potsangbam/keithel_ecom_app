import 'package:flutter/material.dart';
import 'package:keithel/src/utils/theme/widget_themes/appBar_theme.dart';
import 'package:keithel/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:keithel/src/utils/theme/widget_themes/outline_button_theme.dart';
import 'package:keithel/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:keithel/src/utils/theme/widget_themes/text_theme.dart';

class GAppTheme {
  GAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // appBarTheme: gAppBarTheme.lightAppBarTheme,
    brightness: Brightness.light,
    textTheme: GTextTheme.lightTextTheme,
    outlinedButtonTheme: gOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: gElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // appBarTheme: gAppBarTheme.darkAppBarTheme,
    brightness: Brightness.dark,
    textTheme: GTextTheme.darkTextTheme,
    outlinedButtonTheme: gOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: gElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.darkInputDecorationTheme,
  );
}
