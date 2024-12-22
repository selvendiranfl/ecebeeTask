

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}


const double small_text= 0.035;
const double medium_text= 0.04;
const double large_text= 0.045;
const double large_text_mid= 0.050;
const double large_text_extra= 0.055;
const double large_text_double= 0.060;
const double large_text__lit_extra= 0.070;
const double tiny_text= 0.030;
const double tiny_text_extra= 0.025;
const double tiny_text_mid= 0.028;