import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SocialButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppTheme.customWhite,
        side: BorderSide(color: AppTheme.customLightGrey, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h),
      ),
      child: Text(
        text,
        style: GoogleFonts.epilogue(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp.clamp(13, 22),
          color: AppTheme.customBlack,
        ),
      ),
    );
  }
}
