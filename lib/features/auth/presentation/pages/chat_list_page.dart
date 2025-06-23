import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/bottom_nav_bar.dart';
import 'chat_detail_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'avatar': 'https://randomuser.me/api/portraits/women/44.jpg',
        'name': 'Athalia Putri',
        'lastMessage': 'Good morning, did you sleep well?',
        'time': '08:30',
        'unread': true,
      },
      {
        'avatar': 'https://randomuser.me/api/portraits/men/45.jpg',
        'name': 'Erlan Sadewa',
        'lastMessage': 'Alright, noted',
        'time': '07:15',
        'unread': false,
      },
      {
        'avatar': '',
        'name': 'Raki Devon',
        'lastMessage': 'Hi! How is it going?',
        'time': '17%',
        'unread': true,
      },
      {
        'avatar': 'https://randomuser.me/api/portraits/men/46.jpg',
        'name': 'Erlan Sadewa',
        'lastMessage': 'Alright, noted',
        'time': 'Yesterday',
        'unread': false,
      },
      {
        'avatar': 'https://randomuser.me/api/portraits/women/47.jpg',
        'name': 'Athalia Putri',
        'lastMessage': 'Good morning, did you sleep well?',
        'time': 'Today',
        'unread': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar and search
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 16.h, 15.w, 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Social',
                    style: TextStyle(
                      fontFamily: 'Futura-Medium',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontFamily: 'Futura-Medium',
                                color: Colors.grey[500],
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.search, color: Colors.grey[500], size: 22.w),
                        SizedBox(width: 12.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            // Chat list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 8.h,
                  bottom: MediaQuery.of(context).padding.bottom + 80.h,
                ),
                itemCount: chats.length,
                separatorBuilder: (_, __) => SizedBox(height: 4.h),
                itemBuilder: (context, index) {
                  final chat = chats[index] as Map<String, dynamic>;
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 0,
                    ),
                    leading:
                        (chat['avatar'] as String).isNotEmpty
                            ? CircleAvatar(
                              radius: 24.w,
                              backgroundImage: NetworkImage(
                                chat['avatar'] as String,
                              ),
                            )
                            : CircleAvatar(
                              radius: 24.w,
                              backgroundColor: Colors.teal[100],
                              child: Text(
                                (chat['name'] as String)[0],
                                style: TextStyle(
                                  fontFamily: 'Futura-Medium',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                    title: Text(
                      chat['name'] as String,
                      style: TextStyle(
                        fontFamily: 'Futura-Medium',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      chat['lastMessage'] as String,
                      style: TextStyle(
                        fontFamily: 'Futura-Medium',
                        fontSize: 13.sp,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chat['time'] as String,
                          style: TextStyle(
                            fontFamily: 'Futura-Medium',
                            fontSize: 12.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                        // SizedBox(height: 15.sp),
                        if (chat['unread'] == true)
                          Container(
                            margin: EdgeInsets.only(top: 4.h),
                            width: 10.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChatDetailPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}
