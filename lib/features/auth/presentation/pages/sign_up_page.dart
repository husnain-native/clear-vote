import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clear_vote/core/widgets/custom_text_field.dart';
import 'package:clear_vote/core/widgets/custom_button.dart';
import 'package:clear_vote/features/auth/presentation/widgets/custom_checkbox.dart';
import 'package:clear_vote/features/auth/presentation/widgets/divider_with_text.dart';
import 'package:clear_vote/features/auth/presentation/widgets/social_button.dart';
import 'package:clear_vote/features/auth/presentation/widgets/auth_footer_text.dart';
import 'package:clear_vote/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool agreeTerms = false;
  bool agreePrivacy = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppTheme.customCyan2,
                    fontWeight: FontWeight.w700,
                    fontSize: 28.sp.clamp(20, 36),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Create your new account',
                  style: TextStyle(
                    fontSize: 15.sp.clamp(12, 20),
                    color: AppTheme.customGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 26.h),
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
                SizedBox(height: 16.h),
                CustomTextField(
                  label: 'Confirm Password',
                  hint: 'Password123.',
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                SizedBox(height: 16.h),
                CustomCheckbox(
                  value: agreeTerms,
                  onChanged: (v) => setState(() => agreeTerms = v),
                  text: 'By sign up I agree with Terms and Conditions',
                  linkText: 'Terms and Conditions',
                  onLinkTap: () {},
                ),
                CustomCheckbox(
                  value: agreePrivacy,
                  onChanged: (v) => setState(() => agreePrivacy = v),
                  text: 'By sign up I agree with Privacy and Policy',
                  linkText: 'Privacy and Policy',
                  onLinkTap: () {},
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  text: 'Create New Account',
                  onPressed: () {
                    // Navigate to ProfileInformationPage
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SignInPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 26.h),
                const DividerWithText(text: 'Or'),
                SizedBox(height: 26.h),
                SocialButton(text: 'Google', onPressed: () {}),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.h, // Explicitly constrain height
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
        child: AuthFooterText(
          text: 'Already have an account? ',
          linkText: 'Sign In',
          onLinkTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SignInPage()),
            );
          },
        ),
      ),
    );
  }
}