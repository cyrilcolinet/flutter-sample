import 'package:flutter/material.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';

class FontStyles {
  static const TextStyle futuraFont = TextStyle(
    fontFamily: 'Futura',
  );

  static const TextStyle baseFont = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 14,
  );

  static TextStyle get titleButton => futuraFont.copyWith(
        fontSize: 16,
        fontFamily: 'Avenir',
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title => futuraFont.copyWith(
        fontSize: 16,
      );

  static TextStyle get hugeTitle => futuraFont.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: const Color(textColor),
      );
}
