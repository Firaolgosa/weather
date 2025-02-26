import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:math' show pi, cos, sin;

class WeatherCard extends StatefulWidget {
  final String condition;
  final double temperature;
  final String additionalInfo;
  final Color cardColor;

  const WeatherCard({
    super.key,
    required this.condition,
    required this.temperature,
    required this.additionalInfo,
    required this.cardColor,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: widget.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          _buildWeatherAnimation(),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.condition,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${widget.temperature.round()}°C',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.additionalInfo,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherAnimation() {
    switch (widget.condition.toLowerCase()) {
      case 'windy':
        return _buildWindyAnimation();
      case 'rainy':
        return _buildRainyAnimation();
      case 'sunny':
        return _buildSunnyAnimation();
      case 'snowy':
        return _buildSnowyAnimation();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildWindyAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(150.w, 200.h),
          painter: WindPainter(_controller.value),
        );
      },
    );
  }

  Widget _buildRainyAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(150.w, 200.h),
          painter: RainPainter(_controller.value),
        );
      },
    );
  }

  Widget _buildSunnyAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(150.w, 200.h),
          painter: SunPainter(_controller.value),
        );
      },
    );
  }

  Widget _buildSnowyAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(150.w, 200.h),
          painter: SnowPainter(_controller.value),
        );
      },
    );
  }
}

class WindPainter extends CustomPainter {
  final double animationValue;

  WindPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 5; i++) {
      final y = size.height * (0.2 + i * 0.15);
      final x = size.width * (animationValue + i * 0.2) % (size.width + 50) - 25;
      
      canvas.drawLine(
        Offset(x, y),
        Offset(x + 30, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(WindPainter oldDelegate) => true;
}

class RainPainter extends CustomPainter {
  final double animationValue;

  RainPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 20; i++) {
      final x = size.width * ((i * 0.1 + animationValue) % 1);
      final y = size.height * ((i * 0.1 + animationValue * 2) % 1);
      
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + 15),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(RainPainter oldDelegate) => true;
}

class SunPainter extends CustomPainter {
  final double animationValue;

  SunPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width * 0.5, size.height * 0.3);
    final radius = size.width * 0.2;

    // Draw sun circle
    canvas.drawCircle(center, radius, paint);

    // Draw rays
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;

    for (var i = 0; i < 8; i++) {
      final angle = (i * pi / 4) + (animationValue * 2 * pi);
      final startX = center.dx + cos(angle) * (radius + 5);
      final startY = center.dy + sin(angle) * (radius + 5);
      final endX = center.dx + cos(angle) * (radius + 20);
      final endY = center.dy + sin(angle) * (radius + 20);

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(SunPainter oldDelegate) => true;
}

class SnowPainter extends CustomPainter {
  final double animationValue;

  SnowPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (var i = 0; i < 20; i++) {
      final x = size.width * ((i * 0.1 + animationValue) % 1);
      final y = size.height * ((i * 0.1 + animationValue) % 1);
      
      // Draw snowflake
      canvas.drawCircle(Offset(x, y), 2, paint);
      
      // Draw small lines for snowflake effect
      for (var j = 0; j < 4; j++) {
        final angle = j * pi / 2;
        canvas.drawLine(
          Offset(x + cos(angle) * 3, y + sin(angle) * 3),
          Offset(x + cos(angle) * 6, y + sin(angle) * 6),
          paint..strokeWidth = 1,
        );
      }
    }
  }

  @override
  bool shouldRepaint(SnowPainter oldDelegate) => true;
}
