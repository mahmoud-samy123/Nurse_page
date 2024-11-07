import 'package:flutter/material.dart';

import 'package:lovenurse/models/Chat_Page.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ChatTile(
                  imagePath: 'images/image13.png',
                  name: 'Sama Ahmed',
                  message: 'Thank you for the answer!!!',
                  time: 'Today, 2:00PM',
                  unreadMessages: 3,
                ),
                ChatTile(
                  imagePath: 'images/image13.png',
                  name: 'Mariam Mohammed',
                  message: 'Already expected this result...',
                  time: 'Today, 2:00PM',
                ),
                ChatTile(
                  imagePath: 'images/image13.png',
                  name: 'Mohammed Ali',
                  message: 'Please check the audio',
                  time: 'Today, 2:00PM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String message;
  final String time;
  final int? unreadMessages;

  ChatTile({
    required this.imagePath,
    required this.name,
    required this.message,
    required this.time,
    this.unreadMessages,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(name: name),
          ),
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          message,
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            if (unreadMessages != null && unreadMessages! > 0)
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadMessages.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
