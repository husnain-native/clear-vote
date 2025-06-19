import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class OnboardingHeadline extends StatelessWidget {
  final String main;
  final String highlight;
  const OnboardingHeadline({
    super.key,
    required this.main,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: main,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w400,
              fontSize: 34,
              color: AppTheme.customBlack,
            ),
          ),
          const TextSpan(text: '\n'),
          TextSpan(
            text: highlight,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: AppTheme.customCyan2,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
      style: GoogleFonts.epilogue(height: 1.3),
    );
  }
}
