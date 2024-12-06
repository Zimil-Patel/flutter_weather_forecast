import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_forecast/helper/api_helper.dart';
import 'package:flutter_weather_forecast/model/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteProvider extends ChangeNotifier {
  List<WeatherModel> weatherList = [];
  List<String> cityList = [];
  bool favLoading = false;
  bool isFav = false;
  bool isEditing = false;

  // TOGGLE EDITING
  void toggleEditing() {
    isEditing = !isEditing;
    notifyListeners();
  }

  // CHECK IF GIVEN CITY IS FAVOURITE
  void checkIfContain(String city) {
    isFav = false;
    for (WeatherModel ele in weatherList) {
      if (ele.location.name == city || cityList.contains(city)) {
        isFav = true;
      }
    }

    // log("Checked : $isFav");
  }

  //  ADD TO FAVOURTIE
  void addToFav(WeatherModel weather) {
    weatherList.add(weather);
    cityList.add(weather.location.name);
    saveToPreference();
    checkIfContain(weather.location.name);
    notifyListeners();
  }

  // REMOVE FROM FAVOURTIE
  void removeFromFav(String city) {
    cityList.remove(city);
    weatherList.removeWhere((element) => element.location.name == city);
    saveToPreference();
    checkIfContain(city);
    notifyListeners();
  }

  // GET LATETS UPDATE OF WEATHER
  Future<void> getLatestUpdate() async {
    favLoading = true;
    weatherList.clear();
    for (String city in cityList) {
      String response =
          await ApiHelper.apiHelper.callApi(EndPoint.forecastEndPoint(city));

      if (response.isNotEmpty) {
        final data = jsonDecode(response);
        WeatherModel weatherModel = WeatherModel.formJson(data);
        log("Got Forecast: ${weatherModel.location.name}");
        weatherList.add(weatherModel);
      }
    }
    favLoading = false;

    notifyListeners();
  }

  // SAVE LIST TO LOCAL STORAGE
  Future<void> saveToPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList('cityList', cityList);
    log("Preference Saved : $cityList");
  }

  // GET LIST FROM LOCAL STORAGE
  Future<void> getPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('cityList')) {
      cityList.clear();
      cityList = preferences.getStringList('cityList') ?? [];
      await getLatestUpdate();
      // log("Got Preference : $cityList");
    } else {
      log("No Preference found!!!");
    }

    notifyListeners();
  }

  Future<void> init() async {
    await getPreference();
  }

  FavouriteProvider() {
    init();
  }
}
