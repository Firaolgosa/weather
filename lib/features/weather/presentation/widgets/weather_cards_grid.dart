import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'weather_card.dart';

class WeatherCardsGrid extends StatelessWidget {
  const WeatherCardsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.r),
      mainAxisSpacing: 16.r,
      crossAxisSpacing: 16.r,
      children: const [
        WeatherCard(
          condition: 'Windy',
          temperature: 18,
          additionalInfo: 'Wind: 25 km/h',
          cardColor: Color(0xFF1B1B3A),
        ),
        WeatherCard(
          condition: 'Rainy',
          temperature: 14,
          additionalInfo: 'Precipitation: 80%',
          cardColor: Color(0xFF24243C),
        ),
        WeatherCard(
          condition: 'Sunny',
          temperature: 28,
          additionalInfo: 'UV Index: High',
          cardColor: Color(0xFF2C2C4E),
        ),
        WeatherCard(
          condition: 'Snowy',
          temperature: -5,
          additionalInfo: 'Snowfall: 6 cm',
          cardColor: Color(0xFF1E1E3C),
        ),
      ],
    );
  }
} 