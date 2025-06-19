import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:clear_vote/core/theme/app_theme.dart';
import 'package:clear_vote/core/widgets/custom_text_field.dart';
import 'package:clear_vote/core/widgets/custom_button.dart';
import 'package:clear_vote/features/auth/presentation/pages/upload_images_page.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                              color: AppTheme.customGrey,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              'Back',
                              style: GoogleFonts.epilogue(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppTheme.customGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // const SizedBox(height: 32),
                Text(
                  'Profile Information',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: AppTheme.customCyan2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    width: 125.93,
                    height: 136,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        // Circular Avatar with border
                        Container(
                          width: 125.93,
                          height: 125.93,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.customCyan2,
                              width: 2,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 125.93 / 2,
                              backgroundColor: AppTheme.customWhite,
                              backgroundImage:
                                  _profileImage != null
                                      ? FileImage(_profileImage!)
                                      : null,
                              child:
                                  _profileImage == null
                                      ? Icon(
                                        Icons.person,
                                        size: 54,
                                        color: AppTheme.customCyan2,
                                      )
                                      : null,
                            ),
                          ),
                        ),
                        // Add icon container (overlapping bottom border)
                        Positioned(
                          bottom: -10, // negative value to overlap
                          left: (145.93 - 42.75) / 2, // center horizontally
                          child: Container(
                            width: 25.75,
                            height: 24.75,
                            decoration: BoxDecoration(
                              color: AppTheme.customCyan2,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.customCyan2,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 21.75,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Full Name',
                  hint: 'Jhon Doe',
                  controller: _nameController,
                ),
                const SizedBox(height: 16),
                // State Dropdown with label
                Text(
                  'State',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppTheme.customGrey,
                  ),
                ),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: _selectedState,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
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
                                style: GoogleFonts.epilogue(fontSize: 15),
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
                const SizedBox(height: 16),
                // City Dropdown with label
                Text(
                  'City',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppTheme.customGrey,
                  ),
                ),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: _selectedCity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
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
                                style: GoogleFonts.epilogue(fontSize: 15),
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
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Address',
                  hint: 'Great street 01',
                  controller: _addressController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone Number',
                  hint: '+1',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const UploadImagesPage(),
                      ),
                    );
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
