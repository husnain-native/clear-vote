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
    final colorScheme = theme.colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppTheme.customCyan2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Create your new account',
                    style: TextStyle(fontSize: 15, color: AppTheme.customGrey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    label: 'Email',
                    hint: 'example@email.com',
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Password',
                    hint: 'Password123.',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Confirm Password',
                    hint: 'Password123.',
                    controller: confirmPasswordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  CustomButton(text: 'Create New Account', onPressed: () {}),
                  const SizedBox(height: 26),
                  const DividerWithText(text: 'Or'),
                  const SizedBox(height: 26),
                  SocialButton(text: 'Google', onPressed: () {}),
                  const SizedBox(height: 94),
                  AuthFooterText(
                    text: 'Already have an account? ',
                    linkText: 'Sign In',
                    onLinkTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SignInPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
