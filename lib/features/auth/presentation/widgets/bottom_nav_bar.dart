import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import '../pages/vote_page.dart';
import '../pages/candidate_voting_page.dart';
import '../pages/chat_list_page.dart';
import '../pages/settings_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;
  const BottomNavBar({super.key, this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.how_to_vote, 'label': 'Vote'},
      {'icon': Icons.people_alt_outlined, 'label': 'Social'},
      {'icon': Icons.create_outlined, 'label': 'Create'},
      {'icon': Icons.settings, 'label': 'Setting'},
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32.r)),
          border: Border.all(color: AppTheme.customCyan2, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (i) {
            final selected = i == selectedIndex;
            return GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(i);
                }
                if (i == 0 && selectedIndex != 0) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const CandidateVotingPage(),
                    ),
                  );
                }
                if (i == 1 && selectedIndex != 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const VotePage()),
                  );
                }
                if (i == 2 && selectedIndex != 2) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ChatListPage()),
                  );
                }
                if (i == 4 && selectedIndex != 4) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  );
                }
                // Add navigation for other icons as needed
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[i]['icon'] as IconData,
                    color: selected ? AppTheme.customCyan2 : Colors.grey[400],
                    size: 28.w,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    items[i]['label'] as String,
                    style: GoogleFonts.epilogue(
                      color: selected ? AppTheme.customCyan2 : Colors.grey[400],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
