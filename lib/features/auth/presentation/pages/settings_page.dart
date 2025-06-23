import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/bottom_nav_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Futura-Medium',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        children: [
          // Profile section
          Row(
            children: [
              CircleAvatar(
                radius: 28.w,
                backgroundColor: const Color(0xFFE0F2F1),
                child: Icon(
                  Icons.person,
                  color: const Color(0xFF009688),
                  size: 32.w,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Marston',
                    style: TextStyle(
                      fontFamily: 'Futura-Medium',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '+1 234 5679 9991',
                    style: TextStyle(
                      fontFamily: 'Futura-Medium',
                      fontSize: 14.sp,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 28.h),
          _SettingsOption(
            icon: Icons.person_outline,
            label: 'Edit Profile',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const EditProfilePage()),
              );
            },
          ),
          _SettingsOption(
            icon: Icons.subscriptions_outlined,
            label: 'Subscription',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SubscriptionPage()),
              );
            },
          ),
          _SettingsOption(
            icon: Icons.privacy_tip_outlined,
            label: 'Privacy',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PrivacyPage()));
            },
          ),
          _SettingsOption(
            icon: Icons.folder_open_outlined,
            label: 'Data Usage',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const DataUsagePage()));
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Divider(
              color: const Color(0xFF009688),
              thickness: 1.2,
              height: 1,
            ),
          ),
          _SettingsOption(
            icon: Icons.help_outline,
            label: 'Help',
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const HelpPage()));
            },
          ),
          _SettingsOption(
            icon: Icons.mail_outline,
            label: 'Share with others',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ShareWithOthersPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}

class _SettingsOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _SettingsOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
      leading: Icon(icon, color: const Color(0xFF009688), size: 26.w),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Futura-Medium',
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black.withOpacity(0.5),
        size: 18.w,
      ),
      onTap: onTap,
    );
  }
}

// Stylish dummy pages for each option
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40.w,
                backgroundColor: const Color(0xFFE0F2F1),
                child: Icon(
                  Icons.person,
                  color: const Color(0xFF009688),
                  size: 48.w,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text('Name', style: _labelStyle()),
            SizedBox(height: 4.h),
            _ProfileField(value: 'John Marston'),
            SizedBox(height: 16.h),
            Text('Phone', style: _labelStyle()),
            SizedBox(height: 4.h),
            _ProfileField(value: '+1 234 5679 9991'),
            SizedBox(height: 16.h),
            Text('Email', style: _labelStyle()),
            SizedBox(height: 4.h),
            _ProfileField(value: 'john.marston@email.com'),
            SizedBox(height: 32.h),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 12.h,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String value;
  const _ProfileField({required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontFamily: 'Futura-Medium',
          fontSize: 15.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}

TextStyle _labelStyle() => TextStyle(
  fontFamily: 'Futura-Medium',
  fontWeight: FontWeight.w500,
  fontSize: 13.sp,
  color: Colors.grey[600],
);

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Plan', style: _labelStyle()),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.workspace_premium,
                    color: const Color(0xFF009688),
                    size: 32.w,
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Premium Voter',
                        style: TextStyle(
                          fontFamily: 'Futura-Medium',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Valid till: 31 Dec 2024',
                        style: TextStyle(
                          fontFamily: 'Futura-Medium',
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'Upgrade your plan for more voting features and analytics.',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 12.h,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Upgrade',
                  style: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'We value your privacy. All your voting data is encrypted and never shared with third parties. You can control your privacy settings here.',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.h),
            ListTile(
              leading: Icon(Icons.lock_outline, color: const Color(0xFF009688)),
              title: Text(
                'Change Password',
                style: TextStyle(fontFamily: 'Futura-Medium', fontSize: 15.sp),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.visibility_off_outlined,
                color: const Color(0xFF009688),
              ),
              title: Text(
                'Hide Profile from Search',
                style: TextStyle(fontFamily: 'Futura-Medium', fontSize: 15.sp),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}

class DataUsagePage extends StatelessWidget {
  const DataUsagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Usage'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Usage',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Monitor your app data usage and manage your preferences.',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.h),
            ListTile(
              leading: Icon(Icons.data_usage, color: const Color(0xFF009688)),
              title: Text(
                'Total Data Used',
                style: TextStyle(fontFamily: 'Futura-Medium', fontSize: 15.sp),
              ),
              trailing: Text(
                '1.2 GB',
                style: TextStyle(
                  fontFamily: 'Futura-Medium',
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wifi, color: const Color(0xFF009688)),
              title: Text(
                'Wi-Fi Only',
                style: TextStyle(fontFamily: 'Futura-Medium', fontSize: 15.sp),
              ),
              trailing: Switch(value: true, onChanged: (v) {}),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help & Support',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'For any queries or support, contact us at:',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.email_outlined, color: const Color(0xFF009688)),
                SizedBox(width: 8.w),
                Text(
                  'support@clearvote.com',
                  style: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.phone_outlined, color: const Color(0xFF009688)),
                SizedBox(width: 8.w),
                Text(
                  '+1 800 123 4567',
                  style: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}

class ShareWithOthersPage extends StatelessWidget {
  const ShareWithOthersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share with Others'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invite your friends to ClearVote!',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Share the app link below:',
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.link, color: const Color(0xFF009688)),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'https://clearvote.com/app',
                      style: TextStyle(
                        fontFamily: 'Futura-Medium',
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 12.h,
                  ),
                ),
                icon: Icon(Icons.share, color: Colors.white),
                label: Text(
                  'Share Now',
                  style: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}
