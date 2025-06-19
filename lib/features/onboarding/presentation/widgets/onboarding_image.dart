import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  const OnboardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 218,
      left: 31,
      child: SizedBox(
        width: 331,
        height: 236,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 331,
              height: 236,
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.grey[600]),
                    const SizedBox(height: 8),
                    Text(
                      'Image not found:\n$imagePath',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
