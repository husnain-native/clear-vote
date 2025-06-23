import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;
  final String linkText;
  final VoidCallback onLinkTap;
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.linkText,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: value,
            onChanged: (v) => onChanged(v ?? false),
            activeColor: AppTheme.customCyan2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(color: AppTheme.customLightGrey, width: 1.5.w),
            visualDensity: VisualDensity.compact,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    text.replaceAll(linkText, ''),
                    style: GoogleFonts.epilogue(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp.clamp(11, 18),
                      color: AppTheme.customBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: onLinkTap,
                    child: Text(
                      linkText,
                      style: GoogleFonts.epilogue(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp.clamp(11, 18),
                        color: AppTheme.customCyan2,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
