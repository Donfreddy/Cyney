import 'package:flutter/material.dart';

class Insets {
  static double scale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get md => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
}

class Radius {
  static const double scale = 1.0;
  static double get r05 => 05.0 * scale;
  static double get s08 => 08.0 * scale;
  static double get s10 => 10.0 * scale;
  static double get s11 => 11.0 * scale;
  static double get s12 => 12.0 * scale;
}

class Times {
  static const short = const Duration(milliseconds: 100);
  static const medium = const Duration(milliseconds: 300);
  static const long = const Duration(milliseconds: 500);
}

class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1.0;
  static double get s08 => 08.0 * scale;
  static double get s09 => 09.0 * scale;
  static double get s10 => 10.0 * scale;
  static double get s11 => 11.0 * scale;
  static double get s12 => 12.0 * scale;
  static double get s14 => 14.0 * scale;
  static double get s16 => 16.0 * scale;
  static double get s24 => 24.0 * scale;
  static double get s48 => 48.0 * scale;
}

//--------------------------- screen height & width ----------------------------

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

//--------------------------- TextStyles ---------------------------------------

class Fonts {
  static const String rubik = "Rubik";
}

class TextStyles {
  // newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)

  static const TextStyle rubik = TextStyle(fontFamily: Fonts.rubik);

  static TextStyle get body1 => rubik.copyWith(fontSize: FontSizes.s48);
}

// NAME       SIZE   WEIGHT   SPACING  2018 NAME
// display4   112.0  thin     0.0      headline1
// display3   56.0   normal   0.0      headline2
// display2   45.0   normal   0.0      headline3
// display1   34.0   normal   0.0      headline4
// headline   24.0   normal   0.0      headline5
// title      20.0   medium   0.0      headline6
// subhead    16.0   normal   0.0      subtitle1
// body2      14.0   medium   0.0      body1 (bodyText1)
// body1      14.0   normal   0.0      body2 (bodyText2)
// caption    12.0   normal   0.0      caption
// button     14.0   medium   0.0      button
// subtitle   14.0   medium   0.0      subtitle2
// overline   10.0   normal   0.0      overline
