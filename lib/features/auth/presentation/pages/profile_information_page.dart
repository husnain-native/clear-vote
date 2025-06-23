import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:clear_vote/core/widgets/custom_text_field.dart';
import 'package:clear_vote/core/widgets/custom_button.dart';
import 'package:clear_vote/features/auth/presentation/pages/upload_images_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});

  @override
  State<ProfileInformationPage> createState() => _ProfileInformationPageState();
}

class _ProfileInformationPageState extends State<ProfileInformationPage> {
  File? _profileImage;
  final picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedState;
  String? _selectedCity;

  final List<String> _states = ['California', 'Texas', 'New York'];
  final Map<String, List<String>> _cities = {
    'California': ['Los Angeles', 'San Francisco', 'San Diego'],
    'Texas': ['Houston', 'Dallas', 'Austin'],
    'New York': ['New York', 'Buffalo', 'Rochester'],
  };

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedState = 'California';
    _selectedCity = 'Los Angeles';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 24.w,
                              color: AppTheme.customGrey,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Back',
                              style: GoogleFonts.epilogue(
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp.clamp(12, 24),
                                color: AppTheme.customGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Profile Information',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w600,
                    fontSize: 32.sp.clamp(20, 40),
                    color: AppTheme.customCyan2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Container(
                    width: 125.93.w,
                    height: 136.h,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 125.93.w,
                          height: 125.93.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.customCyan2,
                              width: 2.w,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 125.93.w / 2,
                              backgroundColor: AppTheme.customWhite,
                              backgroundImage:
                                  _profileImage != null
                                      ? FileImage(_profileImage!)
                                      : null,
                              child:
                                  _profileImage == null
                                      ? Icon(
                                        Icons.person,
                                        size: 54.w,
                                        color: AppTheme.customCyan2,
                                      )
                                      : null,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10.h,
                          left: (145.93.w - 42.75.w) / 2,
                          child: Container(
                            width: 25.75.w,
                            height: 24.75.h,
                            decoration: BoxDecoration(
                              color: AppTheme.customCyan2,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.customCyan2,
                                width: 2.w,
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 19.75.sp.clamp(16, 29),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  label: 'Full Name',
                  hint: 'Jhon Doe',
                  controller: _nameController,
                ),
                SizedBox(height: 16.h),
                Text(
                  'State',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp.clamp(10, 22),
                    color: AppTheme.customGrey,
                  ),
                ),
                SizedBox(height: 6.h),
                DropdownButtonFormField<String>(
                  value: _selectedState,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: AppTheme.customLightGrey),
                    ),
                  ),
                  items:
                      _states
                          .map(
                            (state) => DropdownMenuItem(
                              value: state,
                              child: Text(
                                state,
                                style: GoogleFonts.epilogue(
                                  fontSize: 15.sp.clamp(10, 22),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedState = val;
                      _selectedCity = null;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                Text(
                  'City',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp.clamp(10, 22),
                    color: AppTheme.customGrey,
                  ),
                ),
                SizedBox(height: 6.h),
                DropdownButtonFormField<String>(
                  value: _selectedCity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: AppTheme.customLightGrey),
                    ),
                  ),
                  items:
                      (_cities[_selectedState] ?? [])
                          .map(
                            (city) => DropdownMenuItem(
                              value: city,
                              child: Text(
                                city,
                                style: GoogleFonts.epilogue(
                                  fontSize: 15.sp.clamp(10, 22),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedCity = val;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  label: 'Address',
                  hint: 'Great street 01',
                  controller: _addressController,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  label: 'Phone Number',
                  hint: '+1',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
        child: CustomButton(
          text: 'Next',
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const UploadImagesPage()));
          },
        ),
      ),
    );
  }
}
