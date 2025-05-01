import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final String name;

  const ChatDetailPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text('Chat with $name'),
      ),
    );
  }
}
