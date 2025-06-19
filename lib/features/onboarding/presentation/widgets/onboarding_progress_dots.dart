import 'package:flutter/material.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

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
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 :9,
          height:9,
          decoration:
              isActive
                  ? BoxDecoration(
                    color: AppTheme.customCyan2,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(8), right: Radius.circular(8)),
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
