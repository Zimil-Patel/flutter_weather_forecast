import 'package:flutter_weather_forecast/model/forecast_model.dart';
import 'package:flutter_weather_forecast/model/location_model.dart';

class WeatherModel {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.formJson(Map map) => WeatherModel(
        location: Location.fromJson(map['location']),
        current: Current.fromJson(map['current']),
        forecast: Forecast.fromJson(map['forecast']),
      );
}

class Current {
  final String lastUpdated, time;
  final double tempC, tempF;
  final int isDay;
  final Condition condition;
  final double windMph,
      windKph,
      visK,
      visM,
      windDegree,
      humidity,
      cloud,
      gustMph,
      gustKph,
      windChillC,
      windChillF,
      heatIndexC,
      heatIndexF,
      pressureMb,
      pressureIn,
      feelsLikeC,
      feelsLikeF,
      precipMm,
      precipIn,
      uv;
  final String windDir;

  Current({
    required this.visK,
    required this.visM,
    required this.time,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.humidity,
    required this.cloud,
    required this.gustMph,
    required this.gustKph,
    required this.windChillC,
    required this.windChillF,
    required this.heatIndexC,
    required this.heatIndexF,
    required this.uv,
    required this.windDir,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.pressureMb,
    required this.pressureIn,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.precipMm,
    required this.precipIn,
  });

  factory Current.fromJson(Map map) => Current(
        lastUpdated: map['last_updated'] ?? " ",
        tempC: map['temp_c'].toDouble(),
        tempF: map['temp_f'].toDouble(),
        isDay: map['is_day'] ?? 1,
        condition: Condition.fromJson(
          map['condition'],
        ),
        windMph: map['wind_mph'].toDouble(),
        gustMph: map['gust_mph'].toDouble(),
        windKph: map['wind_kph'].toDouble(),
        gustKph: map['gust_kph'].toDouble(),
        windChillC: map['windchill_c'].toDouble(),
        windChillF: map['windchill_f'].toDouble(),
        heatIndexC: map['heatindex_c'].toDouble(),
        heatIndexF: map['heatindex_f'].toDouble(),
        windDir: map['wind_dir'],
        cloud: map['cloud'].toDouble(),
        humidity: map['humidity'].toDouble(),
        uv: map['uv'].toDouble(),
        windDegree: map['wind_degree'].toDouble(),
        pressureIn: map['pressure_in'].toDouble(),
        pressureMb: map['pressure_mb'].toDouble(),
        feelsLikeC: map['feelslike_c'].toDouble(),
        feelsLikeF: map['feelslike_f'].toDouble(),
        precipMm: map['precip_mm'].toDouble(),
        precipIn: map['precip_in'].toDouble(),
        time: map['time'] ?? " ",
        visK: map["vis_km"].toDouble(),
        visM: map["vis_miles"].toDouble(),
      );
}

class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map map) =>
      Condition(text: map['text'], icon: map['icon']);
}
