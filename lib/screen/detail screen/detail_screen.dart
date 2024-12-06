import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/hourly_broadcast.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/temprature_card.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/top_bar.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/weather_stat_data.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // TOP BAR SECTION
            TopBar(provider: provider),

            // TEMP, CONDITION, CITY, REGION, COUNTRY
            TempratureCard(provider: provider),

            // STATS
            WeatherStatsData(provider: provider),

            // HOURLY BROADCAST
            HourlyBroadcast(provider: provider),
          ],
        ),
      )),
    );
  }
}
