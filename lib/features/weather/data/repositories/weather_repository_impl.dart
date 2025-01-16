import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_service.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService _weatherService;

  WeatherRepositoryImpl(this._weatherService);

  @override
  Future<WeatherModel> getWeatherByCity(String city) {
    return _weatherService.getWeatherByCity(city);
  }

  @override
  Future<WeatherModel> getWeatherByLocation(double lat, double lon) {
    return _weatherService.getWeatherByLocation(lat, lon);
  }
}
