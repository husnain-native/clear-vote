import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppTheme.customBlack,
            ),
          ),
        ),
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
      ],
    );
  }
}
