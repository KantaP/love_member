import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:flutter/material.dart';

class Base {
  Base._();

  // Button --------------------------------------------------------------

  static ButtonStyle get primaryElevacatedButton => ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: AppColors.primaryColor[500],
      );
  static ButtonStyle get secondaryElevacatedButton =>
      ElevatedButton.styleFrom();
  static ButtonStyle get primaryTextButton => TextButton.styleFrom(
        padding: EdgeInsets.all(0.0),
      );
  static ButtonStyle get secondaryTextButton => TextButton.styleFrom();
  static ButtonStyle get primaryOutLinebutton => OutlinedButton.styleFrom(
        shape: StadiumBorder(),
      );
  // End Button ----------------------------------------------------------

  // Text ----------------------------------------------------------------
  static TextStyle get baseText => TextStyle(
        letterSpacing: -0.24,
        height: 2,
      );

  static TextStyle get whiteText => TextStyle(color: Colors.white);
  static TextStyle get h1Text => TextStyle(fontSize: 60).merge(baseText);
  static TextStyle get h2Text => TextStyle(fontSize: 48).merge(baseText);
  static TextStyle get h3Text => TextStyle(fontSize: 36).merge(baseText);
  static TextStyle get h4Text => TextStyle(fontSize: 24).merge(baseText);
  static TextStyle get h5Text => TextStyle(fontSize: 20).merge(baseText);
  static TextStyle get s1Text => TextStyle(fontSize: 16, fontWeight: FontWeight.w600).merge(baseText);
  static TextStyle get s2Text => TextStyle(fontSize: 14).merge(baseText);
  static TextStyle get b1Text => TextStyle(fontSize: 16).merge(baseText);
  static TextStyle get b2Text => TextStyle(fontSize: 14).merge(baseText);
  static TextStyle get b3Text => TextStyle(fontSize: 12).merge(baseText);
  static TextStyle get b4Text => TextStyle(fontSize: 10).merge(baseText);
  static TextStyle get captionText => TextStyle(fontSize: 12).merge(baseText);
  static TextStyle get buttonText => TextStyle(fontSize: 14).merge(baseText);
  static TextStyle get overlineText => TextStyle(fontSize: 10).merge(baseText);

  static TextStyle get linkText => TextStyle(
        color: AppColors.generalColor['warning'],
      ).merge(baseText);
  static TextStyle get descriptionText => TextStyle(
        fontSize: 15,
      ).merge(baseText).merge(whiteText);
  static TextStyle get navTitle => TextStyle(color: Colors.white);
  // End Text ------------------------------------------------------------

  // Padding -------------------------------------------------------------
  static EdgeInsets get dimension => EdgeInsets.symmetric(
        horizontal: Dimens.horizontal_padding,
        vertical: Dimens.vertical_padding,
      );
  // End Padding ---------------------------------------------------------

  // Box -----------------------------------------------------------------
  // End Box -------------------------------------------------------------

  // Container -----------------------------------------------------------
  // End Container

}
