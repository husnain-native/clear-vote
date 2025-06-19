import 'package:flutter/material.dart';
import 'package:clear_vote/features/auth/presentation/pages/sign_up_page.dart';
import '../widgets/onboarding_image.dart';
import '../widgets/onboarding_headline.dart';
import '../widgets/onboarding_subtext.dart';
import '../widgets/onboarding_progress_dots.dart';
import '../widgets/onboarding_nav_button.dart';
import '../widgets/onboarding_skip_button.dart';

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
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      final page = _pages[index];
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 160 + 236 + 32,
                                ), // Space for image
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: page['headline'] as Widget,
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: page['subtext'] as Widget,
                                ),
                              ],
                            ),
                          ),
                          page['image'] as Widget,
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
            OnboardingSkipButton(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 100,
              child: OnboardingProgressDots(
                currentIndex: _currentPage,
                count: _pages.length,
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
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
          ],
        ),
      ),
    );
  }
}

