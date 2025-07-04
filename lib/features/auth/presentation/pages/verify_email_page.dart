import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clear_vote/core/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/features/auth/presentation/pages/profile_information_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  int secondsLeft = 59;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _startTimer();
  }

  void _startTimer() {
    Future.doWhile(() async {
      if (secondsLeft > 0) {
        await Future.delayed(const Duration(seconds: 1));
        setState(() => secondsLeft--);
        return true;
      }
      return false;
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100.h),
                Text(
                  'Verify your Email',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppTheme.customCyan2,
                    fontSize: 34.sp.clamp(22, 45),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'We already sent a code to your email jhon@*****.com, please input below to\n confirm your email address',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.sp.clamp(10, 28)),
                ),
                SizedBox(height: 42.h),
                Text(
                  'Enter Code here:',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.customCyan2,
                    fontSize: 14.sp.clamp(10, 18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) {
                    return Container(
                      width: 48.w,
                      height: 48.h,
                      margin: EdgeInsets.only(right: i < 4 ? 12.w : 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.customLightGrey,
                          width: 1.5.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextField(
                          controller: _controllers[i],
                          focusNode: i == 0 ? _focusNode : null,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.customGrey,
                            fontSize: 24.sp.clamp(16, 32),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            hintText: '-',
                            hintStyle: TextStyle(
                              color: AppTheme.customBlack,
                              fontSize: 24.sp.clamp(16, 32),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onChanged: (val) {
                            if (val.isNotEmpty && i < 4) {
                              FocusScope.of(context).nextFocus();
                            } else if (val.isEmpty && i > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  text: 'Confirm',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SuccessfullyVerifiedPage(),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3), () {
                      if (mounted) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const ProfileInformationPage(),
                          ),
                        );
                      }
                    });
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Expire in: 00:${secondsLeft.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 14.sp.clamp(10, 24)),
                    ),
                    GestureDetector(
                      onTap:
                          secondsLeft == 0
                              ? () {
                                setState(() => secondsLeft = 59);
                                _startTimer();
                              }
                              : null,
                      child: Text(
                        'Resend code',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 14.sp.clamp(10, 24),
                          fontWeight: FontWeight.w600,
                          color: AppTheme.customBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessfullyVerifiedPage extends StatelessWidget {
  const SuccessfullyVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified, color: AppTheme.customCyan2, size: 100.w),
              SizedBox(height: 32.h),
              Text(
                'Successfully Verified',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w600,
                  fontSize: 34.sp.clamp(22, 40),
                  height: 1.0, // 100%
                  letterSpacing: 0,
                  color: AppTheme.customCyan2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                'Your account is set now. we will redirect you to\nprofile information',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.customGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp.clamp(10, 22),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
