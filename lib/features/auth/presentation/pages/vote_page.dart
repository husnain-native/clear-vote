import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/trending_search_widget.dart';
import '../widgets/candidate_card.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../data/mock_candidates.dart';

class VotePage extends StatelessWidget {
  const VotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Column(
          children: [
            // =================== Trending Search (No Headline) ===================
            const TrendingSearchWidget(),
            SizedBox(height: 10.h),
            // =================== Candidate List ===================
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                itemCount: mockCandidates.length,
                separatorBuilder: (_, __) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final c = mockCandidates[index];
                  return CandidateCard(
                    avatarUrl: c['avatarUrl']!,
                    name: c['name']!,
                    affiliation: c['affiliation']!,
                    party: c['party']!,
                    votingEndsIn: c['votingEndsIn']!,
                    onView: () {},
                    onHide: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // =================== Bottom Navigation Bar ===================
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}
