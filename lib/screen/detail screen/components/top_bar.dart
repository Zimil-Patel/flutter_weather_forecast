import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/animated_theme_button.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/arrow_back_button.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

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

          // CITY NAME
          Text(
            provider.weatherModel!.location.name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: height * 0.03,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),

          // ANIMATED THEME BUTTON
          const ThemeAnimatedButton(),
        ],
      ),
    );
  }
}
