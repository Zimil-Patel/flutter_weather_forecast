import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/helper/api_helper.dart';
import 'package:flutter_weather_forecast/model/location_model.dart';
import 'package:flutter_weather_forecast/model/weather_model.dart';

class HomeProvider extends ChangeNotifier {
  late WeatherModel weatherModel;
  List<Location> locationList = [];

  // Get Locations data
  Future<void> getLocations(String searchVal) async {
    String response =
        await ApiHelper.apiHelper.callApi(EndPoint.locationEndPoint(searchVal));

    if (response.isNotEmpty) {
      final data = jsonDecode(response);
      locationList = (data as List).map((e) => Location.fromJson(e)).toList();
      log("Got Locations List: $locationList");
      notifyListeners();
    }
  }

  // Get Forecast data
  Future<void> getForecast(String city) async {
    String response =
        await ApiHelper.apiHelper.callApi(EndPoint.forecastEndPoint(city));

    if (response.isNotEmpty) {
      final data = jsonDecode(response);
      weatherModel = WeatherModel.formJson(data);
      log("Got Forecast: ${weatherModel.location.name}");
      notifyListeners();
    }
  }
}
