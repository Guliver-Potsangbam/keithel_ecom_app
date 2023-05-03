import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/constants/sizes.dart';

class gOutlinedButtonTheme {
  gOutlinedButtonTheme._(); //to avoid creating instances

  /*-----Light Theme ----*/
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    foregroundColor: gSecondaryColor,
    side: BorderSide(color: gSecondaryColor),
    padding: EdgeInsets.symmetric(vertical: gButtonHeight),
  ));

  /*-----Dark Theme ----*/
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    foregroundColor: gWhiteColor,
    side: BorderSide(color: gWhiteColor),
    padding: EdgeInsets.symmetric(vertical: gButtonHeight),
  ));
}
