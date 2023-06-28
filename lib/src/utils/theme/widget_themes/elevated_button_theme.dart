import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class gElevatedButtonTheme {
  gElevatedButtonTheme._(); //to avoid creating instances

  /*-----Light Theme ----*/
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      foregroundColor: gWhiteColor,
      backgroundColor: gSecondaryColor,
      side: const BorderSide(color: gSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: gButtonHeight),
    ),
  );

  /*-----Dark Theme ----*/
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      foregroundColor: gSecondaryColor,
      backgroundColor: gWhiteColor,
      side: const BorderSide(color: gSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: gButtonHeight),
    ),
  );
}
