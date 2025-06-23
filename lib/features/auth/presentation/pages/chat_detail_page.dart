import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:intl/intl.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'type': 'text',
        'fromMe': false,
        'content': 'Hey! Did you check the new voting results?',
        'time': DateTime.now().subtract(const Duration(minutes: 10)),
      },
      {
        'type': 'image',
        'fromMe': true,
        'content':
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
        'time': DateTime.now().subtract(const Duration(minutes: 8)),
      },
      {
        'type': 'audio',
        'fromMe': false,
        'content': 'audio_sample.mp3', // Placeholder
        'duration': '0:12',
        'time': DateTime.now().subtract(const Duration(minutes: 7)),
      },
      {
        'type': 'text',
        'fromMe': true,
        'content': 'Yes! It was so close.',
        'time': DateTime.now().subtract(const Duration(minutes: 6)),
      },
      {
        'type': 'text',
        'fromMe': false,
        'content': "Let's catch up later?",
        'time': DateTime.now().subtract(const Duration(minutes: 5)),
      },
      {
        'type': 'image',
        'fromMe': false,
        'content':
            'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
        'time': DateTime.now().subtract(const Duration(minutes: 4)),
      },
      {
        'type': 'text',
        'fromMe': true,
        'content': 'Sure, ping me!',
        'time': DateTime.now().subtract(const Duration(minutes: 3)),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 22.w),
            onPressed: () => Navigator.pop(context),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20.w,
                backgroundImage: const NetworkImage(
                  'https://randomuser.me/api/portraits/women/44.jpg',
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Athalia Putri',
                    style: TextStyle(
                      fontFamily: 'Futura-Medium',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontFamily: 'Futura-Medium',
                      fontSize: 12.sp,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.call, color: Colors.teal, size: 22.w),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black, size: 22.w),
              onPressed: () {},
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final msg =
                    messages[messages.length - 1 - index]
                        as Map<String, dynamic>;
                return ChatMessageBubble(msg: msg);
              },
            ),
          ),
          ChatInputBar(),
          SizedBox(height: 8.h),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}

class ChatMessageBubble extends StatelessWidget {
  final Map<String, dynamic> msg;
  const ChatMessageBubble({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    final fromMe = msg['fromMe'] == true;
    final time = msg['time'] as DateTime;
    final timeStr = DateFormat('HH:mm').format(time);
    Widget content;
    switch (msg['type']) {
      case 'text':
        content = Text(
          msg['content'] as String,
          style: TextStyle(
            fontFamily: 'Futura-Medium',
            fontSize: 14.sp,
            color: fromMe ? Colors.white : Colors.black,
          ),
        );
        break;
      case 'image':
        content = ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            msg['content'] as String,
            width: 180.w,
            height: 180.w,
            fit: BoxFit.cover,
          ),
        );
        break;
      case 'audio':
        content = AudioMessageWidget(
          duration: msg['duration'] as String? ?? '0:10',
          fromMe: fromMe,
        );
        break;
      default:
        content = const SizedBox();
    }
    return Align(
      alignment: fromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding:
            msg['type'] == 'text'
                ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h)
                : EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color:
              msg['type'] == 'text'
                  ? (fromMe ? Colors.teal : Colors.white)
                  : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(fromMe ? 16.r : 4.r),
            bottomRight: Radius.circular(fromMe ? 4.r : 16.r),
          ),
          boxShadow: [
            if (msg['type'] == 'text' && !fromMe)
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              fromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            content,
            SizedBox(height: 4.h),
            Text(
              timeStr,
              style: TextStyle(
                fontFamily: 'Futura-Medium',
                fontSize: 11.sp,
                color: fromMe ? Colors.white70 : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioMessageWidget extends StatefulWidget {
  final String duration;
  final bool fromMe;
  const AudioMessageWidget({
    super.key,
    required this.duration,
    required this.fromMe,
  });

  @override
  State<AudioMessageWidget> createState() => _AudioMessageWidgetState();
}

class _AudioMessageWidgetState extends State<AudioMessageWidget> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: widget.fromMe ? Colors.teal[300] : Colors.teal[50],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
              color: widget.fromMe ? Colors.white : Colors.teal,
              size: 28.w,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: widget.fromMe ? Colors.white54 : Colors.teal[200],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            widget.duration,
            style: TextStyle(
              fontFamily: 'Futura-Medium',
              fontSize: 12.sp,
              color: widget.fromMe ? Colors.white : Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInputBar extends StatelessWidget {
  ChatInputBar({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.teal, size: 28.w),
            onPressed: () {
              // TODO: Pick image/audio
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message',
                  hintStyle: TextStyle(
                    fontFamily: 'Futura-Medium',
                    fontSize: 14.sp,
                    color: Colors.grey[500],
                  ),
                ),
                minLines: 1,
                maxLines: 4,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white, size: 22.w),
              onPressed: () {
                // TODO: Send text message
              },
            ),
          ),
        ],
      ),
    );
  }
}
