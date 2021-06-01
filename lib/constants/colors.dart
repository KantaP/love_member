import 'package:boilerplate/utils/color/color_utils.dart';
import 'package:flutter/material.dart';

class AppColors {

  AppColors._();


  static final Map<int, Color> primaryColor = <int, HexColor>{
    50:  HexColor('#FCEAEE'),
    100: HexColor('#F69CBC'),
    200: HexColor('#EE77A1'),
    300: HexColor('#E7588A'),
    400: HexColor('#E13B76'),
    500: HexColor('#DA1A5E'),
    600: HexColor('#C51453'),
    700: HexColor('#A60F44'),
    800: HexColor('#900A39'),
    900: HexColor('#6D0328')
  };

  static final Map<int, Color> secondaryColor = <int, HexColor>{
    50:  HexColor('#F0F1F1'),
    100: HexColor('#E1E2E4'),
    200: HexColor('#C4C6C9'),
    300: HexColor('#A7AAAE'),
    400: HexColor('#8A8E93'),
    500: HexColor('#6D7278'),
    600: HexColor('#575B60'),
    700: HexColor('#414448'),
    800: HexColor('#2B2D30'),
    900: HexColor('#151618')
  };

  static final Map<String, Color> generalColor = <String , HexColor>{
    'success': HexColor('#7AC844'),
    'info': HexColor('#029DE5'),
    'warning': HexColor('#FFCA00'),
    'error': HexColor('#EB0000'),
  };
}
