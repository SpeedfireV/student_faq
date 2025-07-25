import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';

class ButtonStyles {
  static ButtonStyle primaryElevatedButton = ElevatedButton.styleFrom();
  static ButtonStyle primaryInversedElevatedButton =
      ElevatedButton.styleFrom(backgroundColor: ColorPalette.brown);
  static ButtonStyle optionsElevatedButton = ElevatedButton.styleFrom(
      backgroundColor: ColorPalette.snowWhiteColor,
      elevation: 4,
      minimumSize: const Size(double.infinity, 48));
  static ButtonStyle whitePrimaryElevatedButton =
      ElevatedButton.styleFrom(backgroundColor: ColorPalette.snowWhiteColor);
}
