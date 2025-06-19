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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppTheme.customCyan2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Sign in to continue',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
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
                      const SizedBox(height: 8),
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
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Login',
                        isLoading: isLoading,
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
                      const SizedBox(height: 26),
                      const DividerWithText(text: 'Or'),
                      const SizedBox(height: 26),
                      SocialButton(text: 'Google', onPressed: () {}),
                      const SizedBox(height: 12),
                      SocialButton(text: 'Apple', onPressed: () {}),
                      const SizedBox(height: 168),
                      AuthFooterText(
                        text: "Don't have an account? ",
                        linkText: 'Sign Up',
                        onLinkTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const SignUpPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withValues(alpha: 0.5),
                  child: Center(
                    child: Container(
                      width: 181.44,
                      height: 181.44,
                      padding: const EdgeInsets.fromLTRB(
                        13.34,
                        21.35,
                        13.34,
                        21.35,
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10.67),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                          SizedBox(height: 13.34),
                          Text(
                            'Logging in',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255),
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
      ),
    );
  }
}
