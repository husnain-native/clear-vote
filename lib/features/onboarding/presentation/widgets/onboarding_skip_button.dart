import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback? onTap;
  const OnboardingSkipButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: GestureDetector(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44.w, // standard touch target min width
              minHeight: 24.h, // standard touch target min height
              maxWidth: 80.w, // optional, prevents it from being too large
              maxHeight: 40.h, // optional
            ),
            child: SizedBox(
              width: 30.w,
              height: 18.h,
              child: Text(
                'Skip',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w500,
                  fontSize: (14.sp).clamp(14, 22),
                  height: 1.0,
                  letterSpacing: 0,
                  color: AppTheme.customCyan2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
