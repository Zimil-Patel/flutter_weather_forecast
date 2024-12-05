import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class CityAndCountry extends StatelessWidget {
  const CityAndCountry({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${provider.weatherModel!.location.name}, ",
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.038,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(color: Colors.black, blurRadius: 20, offset: Offset(2, 2)),
            ],
          ),
        ),
        Text(
          provider.weatherModel!.location.country,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: height * 0.024,
          ),
        ),
      ],
    );
  }
}
