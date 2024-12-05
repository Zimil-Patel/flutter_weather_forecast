import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              'assets/gif/day.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
