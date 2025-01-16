import 'package:dio/dio.dart';
import '../models/weather_model.dart';
import '../../../../core/constants/api_constants.dart';

class WeatherService {
  final Dio _dio;

  WeatherService(this._dio);

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.weatherEndpoint}',
        queryParameters: {
          'q': city,
          'appid': ApiConstants.apiKey,
          'units': 'metric',
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch weather data');
    }
  }

  Future<WeatherModel> getWeatherByLocation(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.weatherEndpoint}',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': ApiConstants.apiKey,
          'units': 'metric',
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch weather data');
    }
  }
}
