import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
          color: AppTheme.customCyan2,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Text(
              'Remaining Time for State Election',
              style: GoogleFonts.epilogue(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                TimerCircle(label: 'Days', value: '02'),
                TimerCircle(label: 'Hours', value: '17'),
                TimerCircle(label: 'Mins', value: '47'),
                TimerCircle(label: 'Sec', value: '59'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimerCircle extends StatelessWidget {
  final String label;
  final String value;
  const TimerCircle({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          foregroundPainter: DashedCircleBorderPainter(
            color: AppTheme.customWhite,
            strokeWidth: 1,
            dashLength: 14,
            gapLength: 10,
          ),
          child: Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: AppTheme.customTimerBox,
              borderRadius: BorderRadius.circular(28.w),
            ),
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.epilogue(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.epilogue(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class DashedCircleBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  DashedCircleBorderPainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashLength = 6,
    this.gapLength = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final double radius = (size.width / 2) - strokeWidth / 2;
    final double circumference = 2 * 3.141592653589793 * radius;
    final int dashCount = (circumference / (dashLength + gapLength)).floor();
    final double dashAngle = 2 * 3.141592653589793 / dashCount;
    final double gapAngle = dashAngle * gapLength / (dashLength + gapLength);
    final double arcAngle = dashAngle * dashLength / (dashLength + gapLength);

    for (int i = 0; i < dashCount; i++) {
      final double startAngle = i * dashAngle;
      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius,
        ),
        startAngle,
        arcAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
