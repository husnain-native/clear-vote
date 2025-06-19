import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:clear_vote/features/onboarding/presentation/pages/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ClearVote',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.epilogue(
                      fontWeight: FontWeight.w600,
                      fontSize: 42,
                      height: 1.0,
                      letterSpacing: 0,
                      color: AppTheme.customBlack,
                    ),
                  ),
                  // const SizedBox(height: 3),
                  Text(
                    'Your voice matter',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.epilogue(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      // height: 1.0,
                      letterSpacing: 0,
                      color: AppTheme.customBlack,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: Text(
                'Copyright © ClearVote, 2025',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.0,
                  letterSpacing: 0,
                  color: AppTheme.customBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
