import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/bounce_weather_image.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/city_country.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/daily_forecast.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/loading_effect.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/search_section.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/search_suggestions.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/temp_and_condition.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/weather_stat.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);

    return provider.isLoading
        ? const LoadingEffect()
        : Stack(
            fit: StackFit.expand,
            children: [
              // Background GIF
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.3,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), // Adjust opacity here
                        BlendMode
                            .srcOver, // Applies the filter on top of the image
                      ),
                      image: AssetImage(
                        provider.weatherModel!.current.isDay == 0
                            ? 'assets/gif/night.gif'
                            : 'assets/gif/day.gif',
                      ),
                    ),
                  ),
                ),
              ),
              // Foreground Column
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SEARCH SECTION
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        child: const SearchSection(),
                      ),

                      Stack(
                        children: [
                          // WEATHER IMAGE
                          Column(
                            children: [
                              // CITY, COUNTRY
                              CityAndCountry(provider: provider),

                              // WEATHER IMAGE
                              BounceWeatherImage(
                                image: weatherImages.containsKey(provider
                                        .weatherModel!.current.condition.text)
                                    ? weatherImages[provider.weatherModel!
                                            .current.condition.text]
                                        .toString()
                                    : 'assets/images/weather/cloudy.png',
                              ),

                              // TEMPRATURE
                              TempAndCondition(provider: provider),

                              // WEATHER STATS WIND, HUMIDITY, CLOUD
                              WeatherStat(provider: provider),

                              // UPCOMING DAYS FORECAST
                              const DailyForecast(),
                            ],
                          ),

                          // SUGGESTION OF SEARCH RESULT
                          const SearchSuggestions(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
