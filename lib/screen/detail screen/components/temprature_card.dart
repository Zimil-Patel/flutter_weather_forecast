import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class TempratureCard extends StatelessWidget {
  const TempratureCard({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // TEMP AND CONDITION
          TempAndCondition(provider: provider),

          // LOCATIONS CITY, REGION, COUNTRY
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${provider.weatherModel!.location.name} ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: height * 0.02,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    "${provider.weatherModel!.location.region},  ${provider.weatherModel!.location.country}",
                    softWrap: true,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: height * 0.015,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TempAndCondition extends StatelessWidget {
  const TempAndCondition({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defPadding * 2),
      child: Column(
        children: [
          // TEMP
          Text(
            "${provider.weatherModel!.current.tempC} °C",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: height * 0.06,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
          ),

          // TEMP
          Text(
            "${provider.weatherModel!.current.tempF} °F",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: height * 0.02,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
          ),

          // CONDITION
          Row(
            children: [
              Text(
                "${provider.weatherModel!.current.condition.text} ",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: height * 0.02,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              SizedBox(
                height: height * 0.03,
                width: height * 0.03,
                child: Image.network(
                    "https:${provider.weatherModel!.current.condition.icon}"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
