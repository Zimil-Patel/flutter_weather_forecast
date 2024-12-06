import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/detail_screen.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class WeatherStat extends StatelessWidget {
  const WeatherStat({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: defPadding * 2, horizontal: defPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // WIND SPEED
          IconLableStat(
            icon: Icons.wind_power_outlined,
            label: " ${provider.weatherModel!.current.windKph.toInt()} kph",
          ),

          // Humidity
          IconLableStat(
            icon: Icons.water_drop_outlined,
            label: " ${provider.weatherModel!.current.humidity.toInt()}%",
          ),

          // VIEW DETAILS
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailScreen()));
            },
            child: BlurryContainer(
              blur: 8,
              borderRadius: BorderRadius.circular(100),
              color: Colors.black54.withOpacity(0.5),
              child: const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(defPadding / 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconLableStat extends StatelessWidget {
  const IconLableStat({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: height * 0.036,
          shadows: const [
            Shadow(color: Colors.black, blurRadius: 20, offset: Offset(2, 2)),
          ],
        ),
        Text(
          label,
          softWrap: true,
          style: TextStyle(
            fontSize: height * 0.020,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            shadows: const [
              Shadow(color: Colors.black, blurRadius: 20, offset: Offset(2, 2)),
            ],
          ),
        )
      ],
    );
  }
}
