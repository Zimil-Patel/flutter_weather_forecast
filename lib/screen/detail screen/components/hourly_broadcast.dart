import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:intl/intl.dart';

class HourlyBroadcast extends StatelessWidget {
  const HourlyBroadcast({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HOURLY TITLE
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defPadding * 2, vertical: defPadding),
          child: Row(
            children: [
              const Icon(Icons.history_toggle_off_rounded),
              Text(
                '  Hourly broadcast',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: height * 0.016,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),

        // BROADCAST LIST
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                provider.weatherModel!.forecast.forecastList[0].hoursDataList
                    .length,
                (index) => Container(
                  width: width / 4,
                  margin: const EdgeInsets.symmetric(
                      horizontal: defPadding, vertical: defPadding / 2),
                  padding: const EdgeInsets.all(defPadding * 1.2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // DATE
                      Text(
                        getTime(provider.weatherModel!.forecast.forecastList[0]
                            .hoursDataList[index].time),
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: height * 0.016,
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                      ),

                      // IMAGE ICON
                      SizedBox(
                        height: height * 0.06,
                        width: height * 0.06,
                        child: Image.network(
                            "https:${provider.weatherModel!.forecast.forecastList[0].hoursDataList[index].condition.icon}"),
                      ),

                      // TEMPRATURE
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        provider.weatherModel!.forecast.forecastList[0]
                                .hoursDataList[index].tempC
                                .toString() +
                            " °",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: height * 0.016,
                              height: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String getTime(String dateTimeString) {
  DateTime inputDateTime =
      DateTime.parse(dateTimeString); // Parse the input string
  DateTime now = DateTime.now(); // Get the current date and time

  // Check if the input time is the current time
  if (inputDateTime.hour == now.hour) {
    return "Now";
  }

  // Return the time in 24-hour format
  return DateFormat('HH:mm').format(inputDateTime);
}
