import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HourlyForecast extends StatelessWidget {
  final List<HourlyWeather> hourlyData;
  final int selectedHourIndex;
  final Function(int) onHourSelected;

  const HourlyForecast({
    super.key,
    required this.hourlyData,
    required this.selectedHourIndex,
    required this.onHourSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyData.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final hour = hourlyData[index];
          final isSelected = index == selectedHourIndex;

          return GestureDetector(
            onTap: () => onHourSelected(index),
            child: Container(
              width: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: isSelected ? Colors.yellow : Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('ha').format(hour.time),
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: isSelected ? Colors.black : Colors.grey[400],
                    ),
                  ),
                  Icon(
                    hour.getWeatherIcon(),
                    color: isSelected ? Colors.black : Colors.grey[400],
                    size: 24.r,
                  ),
                  Text(
                    '${hour.temperature.round()}°',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.black : Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HourlyWeather {
  final DateTime time;
  final double temperature;
  final String condition;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.condition,
  });

  IconData getWeatherIcon() {
    switch (condition.toLowerCase()) {
      case 'rain':
        return Icons.water_drop;
      case 'cloudy':
        return Icons.cloud;
      case 'sunny':
        return Icons.wb_sunny;
      default:
        return Icons.cloud;
    }
  }
} 