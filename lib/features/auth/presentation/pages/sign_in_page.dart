import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clear_vote/core/widgets/custom_text_field.dart';
import 'package:clear_vote/core/widgets/custom_button.dart';
import 'package:clear_vote/features/auth/presentation/widgets/divider_with_text.dart';
import 'package:clear_vote/features/auth/presentation/widgets/social_button.dart';
import 'package:clear_vote/features/auth/presentation/widgets/auth_footer_text.dart';
import 'package:clear_vote/features/auth/presentation/pages/sign_up_page.dart';
import 'package:clear_vote/features/auth/presentation/pages/verify_email_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppTheme.customCyan2,
                          fontWeight: FontWeight.w700,
                          fontSize: 28.sp.clamp(20, 36),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Sign in to continue',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 15.sp.clamp(12, 20),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      CustomTextField(
                        label: 'Email',
                        hint: 'example@email.com',
                        controller: emailController,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        label: 'Password',
                        hint: 'Password123.',
                        controller: passwordController,
                        obscureText: true,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp.clamp(10, 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(height: 64.h),
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          setState(() => isLoading = true);
                          // Simulate loading
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() => isLoading = false);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const VerifyEmailPage(),
                              ),
                            );
                          });
                        },
                      ),

                      SizedBox(height: 26.h),
                      const DividerWithText(text: 'Or'),
                      SizedBox(height: 26.h),
                      SocialButton(text: 'Google', onPressed: () {}),
                      SizedBox(height: 12.h),
                      SocialButton(text: 'Apple', onPressed: () {}),
                     
                    ],
                  ),
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: 181.44.w,
                      height: 181.44.h,
                      padding: EdgeInsets.fromLTRB(
                        13.34.w,
                        21.35.h,
                        13.34.w,
                        21.35.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.67.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                          SizedBox(height: 13.34.h),
                          Text(
                            'Logging in',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18.sp.clamp(14, 24),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
        height: 60.h, // Explicitly constrain height
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
        child: AuthFooterText(
          text: 'Don\'t have an account? ',
          linkText: 'Sign Up',
          onLinkTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SignUpPage()),
            );
          },
        ),
      ),
      ),
    );
  }
}
