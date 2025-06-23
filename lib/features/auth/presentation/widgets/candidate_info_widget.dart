import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class CandidateInfoWidget extends StatelessWidget {
  const CandidateInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.w,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/women/44.jpg',
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dinah R.',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: AppTheme.customBlack,
                ),
              ),
              Text(
                'voter',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.notifications_none,
            color: AppTheme.customCyan2,
            size: 28.w,
          ),
        ],
      ),
    );
  }
}
