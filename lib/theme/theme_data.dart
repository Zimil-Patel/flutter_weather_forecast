import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherThemeData {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    dialogBackgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      onSurface: Color.fromARGB(189, 237, 238, 241),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.varelaRound(
        color: Colors.black,
        fontSize: height * 0.035,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.varelaRound(
        color: Colors.grey,
        fontSize: height * 0.030,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.varelaRound(color: Colors.black),
      bodyMedium: GoogleFonts.varelaRound(color: Colors.black),
      bodyLarge: GoogleFonts.varelaRound(color: Colors.black),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    dialogBackgroundColor: Colors.grey[900],
    colorScheme: ColorScheme.dark(
      onSurface: const Color(0xff666666).withOpacity(0.2),
      onSecondaryContainer: Colors.grey,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.varelaRound(
        color: Colors.white,
        fontSize: height * 0.035,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.varelaRound(
        color: const Color(0xff666666),
        fontSize: height * 0.030,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.varelaRound(color: Colors.white),
      bodyMedium: GoogleFonts.varelaRound(color: Colors.white),
      bodyLarge: GoogleFonts.varelaRound(color: Colors.white),
    ),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.blue)),
  );
}
