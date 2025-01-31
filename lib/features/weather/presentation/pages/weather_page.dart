import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';
import '../widgets/weather_gauge.dart';
import '../widgets/hourly_forecast.dart';
import '../widgets/precipitation_chart.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildInitialState(),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.yellow),
              ),
              loaded: (weather) => _buildWeatherContent(context, weather),
              error: (message) => _buildErrorState(message),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Weather Forecast',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          ElevatedButton.icon(
            onPressed: () {
              // Implement location permission request
            },
            icon: const Icon(Icons.location_on),
            label: Text(
              'Get Current Location',
              style: GoogleFonts.poppins(),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent(BuildContext context, WeatherModel weather) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(weather),
            SizedBox(height: 24.h),
            WeatherGauge(
              temperature: weather.temp,
              windSpeed: weather.windSpeed,
              minTemp: weather.tempMin,
              maxTemp: weather.tempMax,
            ),
            SizedBox(height: 24.h),
            HourlyForecast(),
            SizedBox(height: 24.h),
            Text(
              'Precipitation Trend',
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            PrecipitationChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(WeatherModel weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.cityName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weather.description,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            // Implement settings or location search
          },
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
