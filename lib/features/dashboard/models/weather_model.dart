class WeatherResponseModel {
  final String weatherType;
  final String temperature;
  final String naverUrl;

  WeatherResponseModel({
    required this.weatherType,
    required this.temperature,
    required this.naverUrl,
  });
}

class WeatherModel {
  final String temperature;
  final String imageUrl;
  final String campusName;
  final String naverUrl;

  WeatherModel({
    required this.temperature,
    required this.imageUrl,
    required this.campusName,
    required this.naverUrl,
  });
}
