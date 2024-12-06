import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/city_box.dart';
import 'package:provider/provider.dart';

class CitySmartWidget extends StatelessWidget {
  const CitySmartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          context.watch<FavouriteProvider>().weatherList.length,
          (index) => CityBox(index: index),
        )
      ],
    );
  }
}
