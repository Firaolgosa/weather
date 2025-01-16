import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit(this._repository) : super(const WeatherState.initial());

  Future<void> getWeatherByCity(String city) async {
    try {
      emit(const WeatherState.loading());
      final weather = await _repository.getWeatherByCity(city);
      emit(WeatherState.loaded(weather));
    } catch (e) {
      emit(WeatherState.error(e.toString()));
    }
  }

  Future<void> getWeatherByLocation(double lat, double lon) async {
    try {
      emit(const WeatherState.loading());
      final weather = await _repository.getWeatherByLocation(lat, lon);
      emit(WeatherState.loaded(weather));
    } catch (e) {
      emit(WeatherState.error(e.toString()));
    }
  }
}
