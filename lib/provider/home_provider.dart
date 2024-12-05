import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/helper/api_helper.dart';
import 'package:flutter_weather_forecast/model/location_model.dart';
import 'package:flutter_weather_forecast/model/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  List<Location> locationList = [];
  bool isLoading = false;
  String defaultCity = "Toronto";

  //Toggle search section
  bool showSearchField = false;
  TextEditingController textCtrl = TextEditingController(text: "");

  // HIDE UNHIDE SEARCHFIELD
  void toggleSearch() {
    showSearchField = !showSearchField;
    if (!showSearchField) {
      locationList.clear();
      textCtrl.text = "";
      isLoading = false;
    }
    notifyListeners();
  }

  // Get Locations data
  Future<void> getLocations(String searchVal) async {
    isLoading = true;
    String response =
        await ApiHelper.apiHelper.callApi(EndPoint.locationEndPoint(searchVal));

    if (response.isNotEmpty) {
      final data = jsonDecode(response);
      locationList = (data as List).map((e) => Location.fromJson(e)).toList();
      log("Got Locations List: $locationList");
      isLoading = false;
      notifyListeners();
    }
  }

  // Get Forecast data
  Future<void> getForecast(String city) async {
    isLoading = true;
    log("Default City: $defaultCity, City: $city");
    defaultCity = city;
    String response =
        await ApiHelper.apiHelper.callApi(EndPoint.forecastEndPoint(city));

    if (response.isNotEmpty) {
      final data = jsonDecode(response);
      weatherModel = WeatherModel.formJson(data);
      log("Got Forecast: ${weatherModel!.location.name}");
      isLoading = false;
      saveToPreference();
      notifyListeners();
    }
  }

  // SAVE LIST TO LOCAL STORAGE
  Future<void> saveToPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('default', defaultCity);
    log("Preference Saved : $defaultCity");
  }

  // GET LIST FROM LOCAL STORAGE
  Future<String> getPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('cityList')) {
      defaultCity = preferences.getString('default') ?? "";
      log("Got Preference : $defaultCity");
    } else {
      log("No Preference found!!!");
    }
    return defaultCity;
  }

  Future<void> init() async {
    await getForecast(await getPreference());
  }

  HomeProvider() {
    init();
  }
}
