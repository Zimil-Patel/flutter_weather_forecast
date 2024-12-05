import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/animation_provider.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/home_screen.dart';
import 'package:flutter_weather_forecast/theme/theme_data.dart';
import 'package:flutter_weather_forecast/theme/theme_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        // THEME
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        // Home
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),

        // Animation
        ChangeNotifierProvider(
          create: (context) => AnimationProvider(),
        ),

        // FAVOURTIE
        ChangeNotifierProvider(
          create: (context) => FavouriteProvider(),
        ),
      ],
      builder: (context, child) => Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          theme: WeatherThemeData.lightTheme,
          darkTheme: WeatherThemeData.darkTheme,
          themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
