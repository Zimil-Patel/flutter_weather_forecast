import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class WeatherStatsData extends StatelessWidget {
  const WeatherStatsData({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.36,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // HUMIDITY
                StatIconLabelValue(
                  iconImage: 'humidity',
                  label: 'Humidity',
                  value: "${provider.weatherModel!.current.humidity}%",
                ),

                // CLOUD
                StatIconLabelValue(
                  iconImage: 'cloud',
                  label: 'Cloud',
                  value: "${provider.weatherModel!.current.cloud}",
                ),

                // uv
                StatIconLabelValue(
                  iconImage: 'uv',
                  label: 'UV',
                  value: "${provider.weatherModel!.current.uv}",
                ),

                // Visibility
                StatIconLabelValue(
                  iconImage: 'visibility',
                  label: 'Visibility',
                  value:
                      "${provider.weatherModel!.current.visM} Miles / \n${provider.weatherModel!.current.visK} km",
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: defPadding, vertical: defPadding / 2),
                  padding: const EdgeInsets.all(defPadding * 1.2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: height * 0.022,
                            width: height * 0.022,
                            child:
                                Image.asset('assets/images/condition/wind.png'),
                          ),
                          const SizedBox(
                            width: defPadding,
                          ),
                          Text(
                            'Wind',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: height * 0.015,
                                  height: 1.5,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defPadding / 2,
                      ),

                      // WIND SPEED KPH / MPH, CHILL, DEGREE, DIRECTION
                      StatLabelValue(
                        label: "Speed (mph)",
                        value: "${provider.weatherModel!.current.windMph}",
                      ),

                      StatLabelValue(
                        label: "Speed (kph)",
                        value: "${provider.weatherModel!.current.windKph}",
                      ),

                      StatLabelValue(
                        label: "Chill (°c)",
                        value: "${provider.weatherModel!.current.windChillC}",
                      ),

                      StatLabelValue(
                        label: "Chill (°f)",
                        value: "${provider.weatherModel!.current.windChillF}",
                      ),

                      StatLabelValue(
                        label: "Degree",
                        value:
                            "${provider.weatherModel!.current.windDegree.toInt()}",
                      ),

                      StatLabelValue(
                        label: "Direction",
                        value: provider.weatherModel!.current.windDir,
                      ),
                    ],
                  ),
                ),
                StatIconLabelValue(
                  iconImage: 'pressure',
                  label: 'Pressure',
                  value:
                      "${provider.weatherModel!.current.pressureIn.toInt()} in / \n${provider.weatherModel!.current.pressureMb.toInt()} mb",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatLabelValue extends StatelessWidget {
  const StatLabelValue({
    super.key,
    required this.label,
    required this.value,
  });

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label : ",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: height * 0.015,
                height: 1.5,
                fontWeight: FontWeight.w700,
              ),
        ),
        Text(
          softWrap: true,
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: height * 0.016,
                height: 1.5,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}

class StatIconLabelValue extends StatelessWidget {
  const StatIconLabelValue({
    super.key,
    required this.iconImage,
    required this.label,
    required this.value,
  });

  final String iconImage, label, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: defPadding, vertical: defPadding / 2),
      padding: const EdgeInsets.all(defPadding * 1.2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.022,
                width: height * 0.022,
                child: Image.asset('assets/images/condition/$iconImage.png'),
              ),
              const SizedBox(
                width: defPadding,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: height * 0.015,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          Text(
            softWrap: true,
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: height * 0.016,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
