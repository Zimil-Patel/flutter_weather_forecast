class Location {
  final int id;
  final double lat, lon;
  final String name, region, country, localtime;

  Location({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
  });

  factory Location.fromJson(Map map) => Location(
        id: map['id'] ?? 0,
        name: map["name"],
        region: map["region"],
        country: map["country"],
        lat: map["lat"]?.toDouble(),
        lon: map["lon"]?.toDouble(),
        localtime: map["localtime"] ?? " ",
      );
}
