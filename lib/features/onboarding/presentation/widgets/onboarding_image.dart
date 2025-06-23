import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  const OnboardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Maintain aspect ratio based on Figma (331/236)
          double aspectRatio = 331 / 236;
          double maxWidth = constraints.maxWidth * 0.85;

          double width = maxWidth.clamp(300.w, 500.w);
          double height = (width / aspectRatio).clamp(190.h, 300.h);
          return Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: width,
                height: height,
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.grey[600]),
                      SizedBox(height: 8.h),
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
          );
        },
      ),
    );
  }
}
