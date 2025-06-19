import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:clear_vote/core/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:clear_vote/features/onboarding/presentation/pages/onboarding_page.dart';

class UploadImagesPage extends StatefulWidget {
  const UploadImagesPage({super.key});

  @override
  State<UploadImagesPage> createState() => _UploadImagesPageState();
}

class _UploadImagesPageState extends State<UploadImagesPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Upload Images',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: AppTheme.customCyan2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Allowed List:',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppTheme.customBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '• ID Card\n• Driving License\n• Passport',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppTheme.customBlack,
                  ),
                ),
                const SizedBox(height: 16),
                // Outer container for shadow and padding
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 355,
                    height: 180,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.customLightImage,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: DashedBorderContainer(
                        width: 188,
                        height: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.customDarkImage,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  size: 36,
                                  color: AppTheme.customCyan2,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Click here to upload',
                                  style: GoogleFonts.epilogue(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.46,
                                    color: AppTheme.customGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_selectedImage != null) ...[
                  const SizedBox(height: 16),
                  DashedBorderContainer(
                    borderRadius: 12,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Image.file(
                            _selectedImage!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            '  Selected Image',
                            style: GoogleFonts.epilogue(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: AppTheme.customGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 300),
                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const DocumentsVerifiedPage(),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      if (mounted) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const OnboardingPage(),
                          ),
                        );
                      }
                    });
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DocumentsVerifiedPage extends StatelessWidget {
  const DocumentsVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified, color: AppTheme.customCyan2, size: 100),
              const SizedBox(height: 32),
              Text(
                'Documents Verified',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w600,
                  fontSize: 34,
                  height: 1.0,
                  letterSpacing: 0,
                  color: AppTheme.customCyan2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Your documents have been verified.\nYou will be redirected.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.customGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
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

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  const DashedBorderContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(borderRadius: borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final double borderRadius;
  _DashedBorderPainter({this.borderRadius = 12});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppTheme.customCyan2
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke;
    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );
    _drawDashedRRect(canvas, rrect, paint, dashWidth, dashSpace);
  }

  void _drawDashedRRect(
    Canvas canvas,
    RRect rrect,
    Paint paint,
    double dashWidth,
    double dashSpace,
  ) {
    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().toList();
    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final len =
            (distance + dashWidth < metric.length)
                ? dashWidth
                : metric.length - distance;
        canvas.drawPath(metric.extractPath(distance, distance + len), paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
