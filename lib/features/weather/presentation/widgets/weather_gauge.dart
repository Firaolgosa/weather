import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherGauge extends StatelessWidget {
  final double temperature;
  final double minTemp;
  final double maxTemp;
  final double windSpeed;

  const WeatherGauge({
    super.key,
    required this.temperature,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200.w,
            height: 200.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                startAngle: 3 * 3.14 / 2,
                endAngle: 7 * 3.14 / 2,
                colors: [
                  Colors.blue.shade200,
                  Colors.yellow.shade400,
                  Colors.orange.shade400,
                ],
              ),
            ),
          ),
          Container(
            width: 170.w,
            height: 170.w,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${temperature.round()}°',
                  style: GoogleFonts.poppins(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${windSpeed.round()} mph',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 