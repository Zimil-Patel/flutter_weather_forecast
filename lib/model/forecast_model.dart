import 'package:flutter_weather_forecast/model/weather_model.dart';

class Forecast {
  final List<ForecastDay> forecastList;

  Forecast({
    required this.forecastList,
  });

  factory Forecast.fromJson(Map map) => Forecast(
        forecastList: (map['forecastday'] as List)
            .map((e) => ForecastDay.fromJson(e))
            .toList(),
      );
}

class ForecastDay {
  final String date;
  final Day day;
  final Astro astro;
  final List<Current> hoursDataList;

  ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hoursDataList,
  });

  factory ForecastDay.fromJson(Map map) => ForecastDay(
        date: map['date'],
        day: Day.fromJson(map['day']),
        astro: Astro.fromJson(map['astro']),
        hoursDataList:
            (map['hour'] as List).map((e) => Current.fromJson(e)).toList(),
      );
}

class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final double dailyWillItRain;
  final double dailyChanceOfRain;
  final double dailyWillItSnow;
  final double dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map map) => Day(
        maxtempC: map["maxtemp_c"].toDouble(),
        maxtempF: map["maxtemp_f"].toDouble(),
        mintempC: map["mintemp_c"].toDouble(),
        mintempF: map["mintemp_f"].toDouble(),
        avgtempC: map["avgtemp_c"].toDouble(),
        avgtempF: map["avgtemp_f"].toDouble(),
        maxwindMph: map["maxwind_mph"].toDouble(),
        maxwindKph: map["maxwind_kph"].toDouble(),
        totalprecipMm: map["totalprecip_mm"].toDouble(),
        totalprecipIn: map["totalprecip_in"].toDouble(),
        totalsnowCm: map["totalsnow_cm"].toDouble(),
        avgvisKm: map["avgvis_km"].toDouble(),
        avgvisMiles: map["avgvis_miles"].toDouble(),
        avghumidity: map["avghumidity"].toDouble(),
        dailyWillItRain: map["daily_will_it_rain"].toDouble(),
        dailyChanceOfRain: map["daily_chance_of_rain"].toDouble(),
        dailyWillItSnow: map["daily_will_it_snow"].toDouble(),
        dailyChanceOfSnow: map["daily_chance_of_snow"].toDouble(),
        condition: Condition.fromJson(map["condition"]),
        uv: map["uv"]?.toDouble(),
      );
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map map) => Astro(
        sunrise: map["sunrise"],
        sunset: map["sunset"],
        moonrise: map["moonrise"],
        moonset: map["moonset"],
        moonPhase: map["moon_phase"],
        moonIllumination: map["moon_illumination"],
        isMoonUp: map["is_moon_up"],
        isSunUp: map["is_sun_up"],
      );
}
