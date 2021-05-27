import 'dart:ui';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class ColorUtils{
  static Color getColorFromRating(int rating,CustomAppTheme customAppTheme,ThemeData themeData){
    switch(rating){
      case 0:
      case 1:
        return customAppTheme.colorError;
      case 2:
        return customAppTheme.colorError.withAlpha(220);
      case 3:
        return Color(0xfff9c700);
      case 4:
        return customAppTheme.colorSuccess.withAlpha(220);
      case 5:
        return customAppTheme.colorSuccess;
    }
    return getColorFromRating(5, customAppTheme, themeData);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  static Color getColorFromOrderStatus(int status) {
    switch (status) {
      case -2:
      case -1:
        return Color.fromRGBO(255, 64, 73, 1.0);
      case 1:
        return Color.fromRGBO(255, 170, 85, 1.0);
      case 2:
        return Color.fromRGBO(90, 149, 154, 1.0);
      case 3:
        return Color.fromRGBO(255, 170, 85, 1.0);
      case 4:
        return Color.fromRGBO(34, 187, 51, 1.0);
      case 5:
        return Color.fromRGBO(34, 187, 51, 1.0);
      default:
        return getColorFromOrderStatus(1);
    }
  }

}