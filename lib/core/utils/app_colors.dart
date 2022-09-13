import 'package:flutter/material.dart';
import 'app_enms.dart';
import 'hex_color.dart';

class AppColors{
  static const Color primaryColor = Color(0xff082659);
  static const Color secondaryColor = Color(0xff51eec2);
  static const Color textColor = Colors.white;
  static const Color icoColor = Colors.white;

   //toast color
   static Color choseColor(ToastStatus status){
  Color color;
  switch(status){
    case ToastStatus.success:
      color = Colors.green;
      break;
    case ToastStatus.error:
      color = Colors.red;
      break;
  }
  return color;
}

}