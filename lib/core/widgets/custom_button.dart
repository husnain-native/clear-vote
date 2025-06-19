import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, outline }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final double? width;
  final double height;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.width,
    this.height = 48.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color backgroundColor;
    Color textColor;
    Color? borderColor;

    switch (variant) {
      case ButtonVariant.primary:
        backgroundColor = colorScheme.primary;
        textColor = colorScheme.onPrimary;
        borderColor = null;
        break;
      case ButtonVariant.secondary:
        backgroundColor = colorScheme.secondary;
        textColor = colorScheme.onSecondary;
        borderColor = null;
        break;
      case ButtonVariant.outline:
        backgroundColor = Colors.transparent;
        textColor = colorScheme.primary;
        borderColor = colorScheme.primary;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.customCyan2,
          foregroundColor: textColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side:
                borderColor != null
                    ? BorderSide(color: borderColor)
                    : BorderSide.none,
          ),
        ),
        child:
            isLoading
                ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  ),
                )
                : Text(
                  text,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
      ),
    );
  }
}
