import 'package:flutter/material.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kDefaultPaddin = 20.0;

//Primary color
const kPrimaryColor = Color(0xFFDB3022);
const primaryColorOrange = Color(0xffFD5D20);

//Text Color
const textColor1 = Color(0xff353047);
const textColor2 = Color(0xff6F6B7A);

//Others colors
const buttonColorPink = Color(0xffFD6B68);

//Backround Color
const backgroundColor1 = Color(0xffE9EAF7);
const backgroundColor2 = Color(0xffF4EEF2);
const backgroundColor3 = Color(0xffEBEBF2);
const backgroundColor4 = Color(0xffE3EDF5);
const backgroundColor5 = Color(0xffF6F6F6);

class CustomFonts {}

class CustomAppColor {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightBackgroundColor_Home = Color.fromARGB(255, 246, 245, 248);
  static Color lightParticleColor = const Color(0x44948282);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightTextColor = Colors.black54;
  static Color lightSecondaryColor = const Color(0xff040415);

  static Color lightYellow = const Color(0xffff8900);
  static Color primaryColorOrange = const Color(0xffFD5D20);

  const CustomAppColor._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColorOrange,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(backgroundColor: primaryColorOrange),
    colorScheme: ColorScheme.light(secondary: lightSecondaryColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: lightBackgroundColor),
    ),
  );
}
