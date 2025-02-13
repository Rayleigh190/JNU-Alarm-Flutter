class WeatherResponseModel {
  final String weatherType;
  final String temperature;

  WeatherResponseModel({required this.weatherType, required this.temperature});
}

class WeatherModel {
  final String temperature;
  final String imageUrl;

  WeatherModel({required this.temperature, required this.imageUrl});
}
