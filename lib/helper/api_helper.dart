import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_forecast/utils/constant.dart';

class ApiHelper {
  // Singletone object
  ApiHelper._instancce();
  static ApiHelper apiHelper = ApiHelper._instancce();

  // CALL API
  Future<String> callApi(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final String json = response.body;
        // log("Api called successfully... : $json");
        return json;
      } else {
        log("Failed to call api!!! : ${response.statusCode}");
      }
    } catch (e) {
      // LOG IF FAILED
      log("Failed to call api!!! : $e");
    }

    return "";
  }
}

class EndPoint {
  static String forecastEndPoint(String city) =>
      "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7&aqi=no&alerts=no";

  static String locationEndPoint(String city) =>
      "https://api.weatherapi.com/v1/search.json?key=$apiKey&q=$city";
}
