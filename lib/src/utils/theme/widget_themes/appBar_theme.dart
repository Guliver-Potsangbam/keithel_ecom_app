import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keithel/src/core/constants/colors.dart';

class gAppBarTheme {
  gAppBarTheme._(); //to avoid creating instances

  /*-----Light Theme ----*/
  static final lightAppBarTheme = AppBarTheme(
      // color: Colors.transparent,
      // elevation: 0,
      // foregroundColor: gDarkColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: gWhiteColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light));

  /*-----Dark Theme ----*/
  static final darkAppBarTheme = AppBarTheme(
      // color: Colors.transparent,
      // elevation: 0,
      // foregroundColor: gWhiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: gSecondaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark));
}
