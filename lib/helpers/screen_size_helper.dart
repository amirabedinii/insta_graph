import 'package:flutter/material.dart';

class ScreenSize {

  static final ScreenSize _instance = ScreenSize._internal();

  static  double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static setDeviceSize(BuildContext context){
    deviceWidth = screenWidth(context);
    deviceHeight = screenHeight(context);
  }
 
  static double? deviceWidth;
  static double? deviceHeight;

  static double baseWidth = 360;
  static double baseHeight = 690;

  
  factory ScreenSize() {
    return _instance;
  }

  ScreenSize._internal() {
    // init things inside this
  }

}