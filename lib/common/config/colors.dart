import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer..write('FF')
      ..write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } else {
      return Colors.red;
    }
  }
}

class AppColors {
  static Color get white => HexColor.fromHex('#FFFFFF');
  static Color get black => HexColor.fromHex('#000000');
  static Color get appBlue100 => HexColor.fromHex('#3665d3');
  static Color get appBlue50 => HexColor.fromHex('#8aa5e5');
  static Color get appBlue20 => HexColor.fromHex('#cdd9f4');
}