import 'package:flutter/material.dart';

//--------------------------- Info cine Theme ---------------------------------

ThemeData lightTheme() {
  return ThemeData(
      // primarySwatch: primaryColorMaterial,
      );
}

ThemeData darkTheme() {
  return ThemeData(
      // primarySwatch: primaryColorMaterial,
      // primaryColorDark: primaryColor,
      // primaryColor: primaryColor,
      // backgroundColor: bgColor,
      // brightness: Brightness.dark,
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      //   centerTitle: true,

      // )
      // colorScheme: ColorScheme.dark(),
      // iconTheme: iconTheme(ThemeData.dark().iconTheme, gray),
      // textTheme: textTheme(ThemeData.dark().textTheme, white),
      );
}

//----------------------------- Icon theme -------------------------------------

IconThemeData iconTheme(IconThemeData original, Color color) {
  return original.copyWith(color: color);
}

//----------------------------- Text theme -------------------------------------

TextTheme textTheme(TextTheme mode, Color color) {
  return mode
      .copyWith(
        headline1: mode.headline1.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 96.0,
        ),
        headline2: mode.headline2.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 60.0,
        ),
        headline3: mode.headline3.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 48.0,
        ),
        headline4: mode.headline4.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 34.0,
        ),
        headline5: mode.headline5.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 24.0,
        ),
        headline6: mode.headline6.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),
        subtitle1: mode.subtitle1.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
        subtitle2: mode.subtitle2.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        bodyText1: mode.bodyText1.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
        bodyText2: mode.bodyText2.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
        ),
        button: mode.button.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
        caption: mode.caption.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 10.0,
        ),
        overline: mode.overline.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 10.0,
        ),
      )
      .apply(
        fontFamily: "Rubik",
        displayColor: color,
        bodyColor: color,
        fontSizeFactor: 1.0,
      );
}

