import 'package:flutter/material.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingProgressDots extends StatelessWidget {
  final int currentIndex;
  final int count;
  const OnboardingProgressDots({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: isActive ? 28.w.clamp(16, 40) : 9.w.clamp(6, 18),
          height: 9.h.clamp(6, 18),
          decoration:
              isActive
                  ? BoxDecoration(
                    color: AppTheme.customCyan2,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8.r.clamp(4, 16)),
                      right: Radius.circular(8.r.clamp(4, 16)),
                    ),
                  )
                  : BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
        );
      }),
    );
  }
}
