import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimationControls extends StatelessWidget {
  final VoidCallback onStartAnimations;
  final VoidCallback onStopAnimations;
  final VoidCallback onSpeedChange;

  const AnimationControls({
    super.key,
    required this.onStartAnimations,
    required this.onStopAnimations,
    required this.onSpeedChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton('Start Animations', onStartAnimations),
        SizedBox(width: 12.w),
        _buildButton('Stop Animations', onStopAnimations),
        SizedBox(width: 12.w),
        _buildButton('Speed: Slow', onSpeedChange),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2C2C4E),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
    );
  }
} 