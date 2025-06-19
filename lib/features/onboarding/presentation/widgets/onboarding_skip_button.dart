import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback? onTap;
  const OnboardingSkipButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 182,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Skip',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.0,
            letterSpacing: 0,
            color: AppTheme.customCyan2,
          ),
        ),
      ),
    );
  }
}
