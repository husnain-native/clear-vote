import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSubtext extends StatelessWidget {
  final String text;
  final String highlight;
  final String tail;
  const OnboardingSubtext({
    super.key,
    required this.text,
    required this.highlight,
    required this.tail,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 0,
            maxWidth: constraints.maxWidth,
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp.clamp(12, 20),
                    height: 1.26,
                    letterSpacing: 0,
                    color: AppTheme.customBlack,
                  ),
                ),
                TextSpan(
                  text: highlight,
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp.clamp(12, 20),
                    height: 1.26,
                    letterSpacing: 0,
                    color: AppTheme.customCyan2,
                  ),
                ),
                TextSpan(
                  text: tail,
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp.clamp(12, 20),
                    height: 1.26,
                    letterSpacing: 0,
                    color: AppTheme.customBlack,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}
