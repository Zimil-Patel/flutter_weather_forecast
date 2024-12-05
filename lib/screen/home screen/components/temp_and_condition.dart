import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class TempAndCondition extends StatelessWidget {
  const TempAndCondition({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CELCIUS AND FAHRENHEIT
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${provider.weatherModel!.current.tempC}° C",
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.038,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(2, 2)),
                ],
              ),
            ),
            const SizedBox(
              width: defPadding * 3,
            ),
            Icon(
              Icons.swap_horiz_rounded,
              color: Colors.white,
              size: height * 0.040,
              shadows: const [
                Shadow(
                    color: Colors.black, blurRadius: 20, offset: Offset(2, 2)),
              ],
            ),
            const SizedBox(
              width: defPadding * 3,
            ),
            Text(
              "${provider.weatherModel!.current.tempC}° F",
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.038,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(2, 2)),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(
          height: defPadding,
        ),

        Text(
          provider.weatherModel!.current.condition.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.020,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(2, 2)),
            ],
          ),
        ),
      ],
    );
  }
}
