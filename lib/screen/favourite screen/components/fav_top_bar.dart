import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/animated_theme_button.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/arrow_back_button.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class FavTopBar extends StatelessWidget {
  const FavTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defPadding, vertical: defPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // BACK BUTTON
          const ArrowBackButton(),

          // ANIMATED THEME BUTTON
          const ThemeAnimatedButton(),
        ],
      ),
    );
  }
}
