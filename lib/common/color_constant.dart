import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color orangeA200 = fromHex('#eb9b3d');

  static Color gray901 = fromHex('#0e1224');

  static Color black900 = fromHex('#01040f');

  static Color indigo50 = fromHex('#e4ebef');

  static Color gray900 = fromHex('#0e1324');

  static Color red90073 = fromHex('#73b60533');

  static Color orangeA20033 = fromHex('#33ec9b3e');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
