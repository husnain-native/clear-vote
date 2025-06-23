import 'package:flutter/material.dart';
import 'package:clear_vote/features/auth/presentation/pages/sign_up_page.dart';
import '../widgets/onboarding_image.dart';
import '../widgets/onboarding_headline.dart';
import '../widgets/onboarding_subtext.dart';
import '../widgets/onboarding_progress_dots.dart';
import '../widgets/onboarding_nav_button.dart';
import '../widgets/onboarding_skip_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'image': const OnboardingImage(
        imagePath: 'assets/images/onboarding1.png',
      ),
      'headline': const OnboardingHeadline(
        main: 'The Only ',
        highlight: 'Voting App for You',
      ),
      'subtext': const OnboardingSubtext(
        text: 'Your voice matters most. Join ',
        highlight: 'ClearVote',
        tail: ' and cast your vote to make a difference',
      ),
    },
    {
      'image': const OnboardingImage(
        imagePath: 'assets/images/onboarding2.png',
      ),
      'headline': const OnboardingHeadline(
        main: 'Voting Made Easy',
        highlight: 'With ClearVote App',
      ),
      'subtext': const OnboardingSubtext(
        text: 'Your voice matters most. Join ',
        highlight: 'ClearVote',
        tail: ' and cast your vote to make a difference',
      ),
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const SignUpPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: OnboardingSkipButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().screenHeight > 900 ? 48.h : 14.h),
            // Image
            Expanded(flex: 5, child: _pages[_currentPage]['image'] as Widget),
            SizedBox(height: ScreenUtil().screenHeight > 900 ? 48.h : 24.h),
            // Headline & Subtext (PageView for swiping)
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:  24.w),
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: _onPageChanged,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        page['headline'] as Widget,
                        SizedBox(height: ScreenUtil().setHeight(16)),
                        page['subtext'] as Widget,
                      ],
                    );
                  },
                ),
              ),
            ),
            // Spacer(),
            // Progress Dots
            Expanded(
              flex: 1,
              child: OnboardingProgressDots(
                currentIndex: _currentPage,
                count: _pages.length,
              ),
            ),
            // SizedBox(height: ScreenUtil().screenHeight > 900 ? 48.h : 24.h),
            // Navigation Buttons
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: OnboardingNavButton(
                  onTap: _nextPage,
                  onBackTap: () {
                    if (_currentPage > 0) {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
