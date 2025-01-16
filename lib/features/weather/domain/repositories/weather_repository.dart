import '../../data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeatherByCity(String city);
  Future<WeatherModel> getWeatherByLocation(double lat, double lon);
}
