import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Column(
      children: [
        // forecast title
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: defPadding,
              ),
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
              ),
              const SizedBox(
                width: defPadding,
              ),
              Text(
                "Daily forecast",
                softWrap: true,
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: height * 0.019,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),

        // NETX 7 DAYS FORECAST
        SizedBox(
          width: width,
          height: height * 0.2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: height * 0.16,
              width: width / 4,
              margin: const EdgeInsets.all(defPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: BlurryContainer(
                blur: 5,
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IMAGE ICON
                    SizedBox(
                      height: height * 0.06,
                      width: height * 0.06,
                      child: Image.network(
                          "https:${provider.weatherModel!.forecast.forecastList[index].day.condition.icon}"),
                    ),

                    // DATE
                    Text(
                      getWeekday(provider
                          .weatherModel!.forecast.forecastList[index].date),
                      softWrap: true,
                      style: TextStyle(
                        fontSize: height * 0.017,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    // TEMPRATURE
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      provider.weatherModel!.forecast.forecastList[index].day
                              .avgtempC
                              .toString() +
                          " °",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: height * 0.021,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}

String getWeekday(String date) {
  DateTime parsedDate = DateTime.parse(date); // Parse the date string
  return DateFormat('EEEE').format(parsedDate); // Format to weekday
}
