class WeatherResponseModel {
  final String weatherType;
  final String temperature;

  WeatherResponseModel({required this.weatherType, required this.temperature});
}

class WeatherModel {
  final String temperature;
  final String imageUrl;
  final String campusName;

  WeatherModel({
    required this.temperature,
    required this.imageUrl,
    required this.campusName,
  });
}
