import 'package:flutter/material.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingNavButton extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onBackTap;
  const OnboardingNavButton({super.key, required this.onTap, this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h.clamp(36, 64),
      child: Stack(
        children: [
          // Back arrow on the left
          if (onBackTap != null)
            Positioned(
              left: 0,
              child: GestureDetector(
                onTap: onBackTap,
                child: Container(
                  width: 48.w.clamp(36, 64),
                  height: 48.h.clamp(36, 64),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppTheme.customCyan2,
                    size: 28.sp.clamp(20, 40),
                  ),
                ),
              ),
            ),
          // Forward arrow on the right
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 48.w.clamp(36, 64),
                height: 48.h.clamp(36, 64),
                decoration: BoxDecoration(
                  color: AppTheme.customCyan2,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 28.sp.clamp(20, 40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
