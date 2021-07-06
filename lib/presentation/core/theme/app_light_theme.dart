import 'package:flutter/material.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_fonts.dart';

final ThemeData lightTheme = ThemeData(
  backgroundColor: Color(fillColor),
  scaffoldBackgroundColor: Color(fillColor),
  primaryColor: const Color(primaryColor),
  accentColor: const Color(accentColor),
  buttonColor: const Color(primaryColor),
  dividerColor: const Color(dividerColor),
  fontFamily: 'Avenir',
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    brightness: Brightness.dark,
    backgroundColor: Color(primaryColor),
  ),
  textTheme: TextTheme(
    button: FontStyles.titleButton,
    headline1: FontStyles.hugeTitle,
    headline2: FontStyles.title,
    subtitle1: FontStyles.baseFont,
    bodyText1: FontStyles.baseFont,
  ),
  cardTheme: cardTheme,
  buttonTheme: buttonTheme,
  errorColor: const Color(errorColor),
  inputDecorationTheme: inputTheme,
);

final CardTheme cardTheme = CardTheme(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  elevation: 7,
  shadowColor: const Color(greyColor).withOpacity(0.2),
);

final ButtonThemeData buttonTheme = ButtonThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    side: const BorderSide(
      color: Color(primaryColor),
    ),
  ),
  buttonColor: const Color(primaryColor),
  textTheme: ButtonTextTheme.primary,
);

final InputDecorationTheme inputTheme = InputDecorationTheme(
  fillColor: const Color(fillColor),
  hintStyle: FontStyles.baseFont.copyWith(
    color: const Color(greyColor),
  ),
  labelStyle: FontStyles.baseFont.copyWith(
    color: const Color(greyColor),
  ),
  suffixStyle: FontStyles.baseFont.copyWith(
    color: const Color(greyColor),
  ),
  prefixStyle: FontStyles.baseFont.copyWith(
    color: const Color(greyColor),
  ),
  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(errorColor),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  border: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(fillColor),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(fillColor),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  disabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(fillColor),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(errorColor),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(fillColor),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  filled: true,
  errorStyle: FontStyles.baseFont.copyWith(
    color: const Color(errorColor),
  ),
);
