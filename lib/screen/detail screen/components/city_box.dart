import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CityBox extends StatelessWidget {
  const CityBox({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavouriteProvider>();
    final providerF = context.read<FavouriteProvider>();
    final data = provider.weatherList[index];

    String city = data.location.name;
    int isDay = data.current.isDay;
    String time = getTimeFormat(data.current.lastUpdated);
    String condition = data.current.condition.text;
    String tempC = data.current.tempC.toString();
    String tempF = data.current.tempF.toString();

    return Row(
      children: [
        // EDIT BUTTON
        context.watch<FavouriteProvider>().isEditing
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: defPadding),
                padding: const EdgeInsets.all(defPadding * 0.01),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    providerF.removeFromFav(city);
                  },
                  child: Icon(
                    size: height * 0.02,
                    Icons.delete_rounded,
                    color: Colors.redAccent,
                  ),
                ),
              )
            : const SizedBox(),

        // CITY CONTAINER
        Expanded(
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<HomeProvider>().getForecast(city);
              Navigator.pop(context);
            },
            child: Container(
              height: height * 0.12,
              margin: const EdgeInsets.all(defPadding),
              padding: const EdgeInsets.symmetric(
                  horizontal: defPadding * 2, vertical: defPadding * 1.2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.6,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), // Adjust opacity here
                    BlendMode.srcOver, // Applies the filter on top of the image
                  ),
                  image: AssetImage(
                    'assets/gif/${isDay != 0 ? 'day' : 'night'}.gif',
                  ),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CITY
                      Text(
                        city,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),

                      // TIME
                      Text(
                        time,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: height * 0.013,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const Spacer(),

                      // CONDITION
                      Text(
                        condition,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: height * 0.013,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // TEMP
                      Text(
                        '$tempC °C',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // fahrenheit
                      Text(
                        '$tempF °F',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: height * 0.013,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String getTimeFormat(String dateTimeString) {
  DateTime inputDateTime =
      DateTime.parse(dateTimeString); // Parse the input string
  DateTime now = DateTime.now(); // Get the current date and time

  // Return the time in 24-hour format
  return DateFormat('HH:mm').format(inputDateTime);
}
