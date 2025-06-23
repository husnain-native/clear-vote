import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class TrendingSearchWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? headline;
  const TrendingSearchWidget({super.key, this.onChanged, this.headline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (headline != null)
            Text(
              headline!,
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppTheme.customBlack,
              ),
            ),
          if (headline != null) SizedBox(height: 10.h),
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: AppTheme.customLightGrey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: GoogleFonts.epilogue(
                        color: AppTheme.customBlack,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.search, color: AppTheme.customBlack, size: 22.w),
                SizedBox(width: 12.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
