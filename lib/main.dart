import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/theme/theme_data.dart';
import 'package:flutter_weather_forecast/theme/theme_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ENSURE THEME GET FETCHED
  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.getThemePreference();

  HomeProvider homeProvider = HomeProvider();
  homeProvider.getForecast("Mumbai");

  runApp(
    MultiProvider(
      providers: [
        // THEME
        ChangeNotifierProvider(
          create: (context) => themeProvider,
        ),

        // Home
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      builder: (context, child) => const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        theme: WeatherThemeData.lightTheme,
        darkTheme: WeatherThemeData.darkTheme,
        themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
