import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';

class CandidateCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String affiliation;
  final String party;
  final String votingEndsIn;
  final VoidCallback onView;
  final VoidCallback onHide;
  final bool showAvatar;
  const CandidateCard({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.affiliation,
    required this.party,
    required this.votingEndsIn,
    required this.onView,
    required this.onHide,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =================== Main Row: Avatar, Details, Buttons ===================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =================== Avatar ===================
              showAvatar
                  ? (avatarUrl.isEmpty
                      ? Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.customCyan2,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          color: AppTheme.customCyan2,
                          size: 32.w,
                        ),
                      )
                      : ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          avatarUrl,
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : SizedBox(width: 48.w),
              SizedBox(width: 12.w),
              // =================== Name, Affiliation, Party ===================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and Hide Button
                    Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Futura-Medium',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: AppTheme.customBlack,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    // Affiliation and Party
                    Row(
                      children: [
                        Text(
                          affiliation,
                          style: TextStyle(
                            fontFamily: 'Futura-Medium',
                            color: AppTheme.customGrey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.customParty,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            party,
                            style: TextStyle(
                              fontFamily: 'Futura-Medium',
                              color: AppTheme.customCyan2,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              // =================== Buttons Column ===================
              Column(
                children: [
                  // =================== Hide Button ===================
                  GestureDetector(
                    onTap: onHide,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'Hide',
                        style: TextStyle(
                          fontFamily: 'Futura-Medium',
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // =================== Timer and View Button Row Under the Main Row ===================
          SizedBox(height: 6.h),
          Row(
            children: [
              // Timer text (light label, bold value)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Voting end in: ',
                      style: TextStyle(
                        fontFamily: 'Futura-Medium',
                        color: AppTheme.customGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    TextSpan(
                      text: votingEndsIn,
                      style: TextStyle(
                        fontFamily: 'Futura-Medium',
                        color: AppTheme.customBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: onView,
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 18.sp,
                  color: AppTheme.customWhite,
                ),
                label: Text(
                  'View',
                  style: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 13.sp,
                    color: AppTheme.customWhite,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.customSubtitleColor,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2),
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
