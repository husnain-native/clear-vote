import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class AuthFooterText extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onLinkTap;
  const AuthFooterText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppTheme.customBlack,
            ),
          ),
          GestureDetector(
            onTap: onLinkTap,
            child: Text(
              linkText,
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppTheme.customCyan2,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
