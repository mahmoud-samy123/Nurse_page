import 'package:flutter/material.dart';
import 'package:lovenurse/models/Chat_Page.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatPage> {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Shahd Ahmed',
      'message': 'Thank you for the answer!!!',
      'time': 'Today, 2:00PM',
      'image': 'images/image13.png',
      'unread': true
    },
    {
      'name': 'Mariam Mohammed',
      'message': 'Already expected this result...',
      'time': 'Today, 2:00PM',
      'image': 'images/image13.png',
      'unread': false
    },
    {
      'name': 'Nesma Ali',
      'message': 'Ill be waiting',
      'time': 'Today, 2:00PM',
      'image': 'images/image14.png',
      'unread': true
    },
    {
      'name': 'Ahmed Ali',
      'message': 'Please check the audio',
      'time': 'Today, 2:00PM',
      'image': 'images/image15.png',
      'unread': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  name: chats[index]['name'],
                  message: chats[index]['message'],
                  time: chats[index]['time'],
                  imageUrl: chats[index]['image'],
                  unread: chats[index]['unread'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailPage(name: chats[index]['name']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool unread;
  final VoidCallback onTap;

  const ChatTile({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.unread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          if (unread)
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
