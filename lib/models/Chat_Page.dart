import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String name; // Add this line to accept the name

  ChatDetailPage({required this.name}); // Adjust constructor to accept name

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(text: _controller.text, isSentByMe: true));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('images/image13.png'), // Placeholder image path
            ),
            SizedBox(width: 8),
            Text(widget.name), // Use the name parameter here
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return MessageBubble(message: message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type something...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;

  Message({required this.text, required this.isSentByMe});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isSentByMe ? Colors.blue : Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: message.isSentByMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isSentByMe ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "08:20", // Update this to the current time if needed
              style: TextStyle(
                color: message.isSentByMe ? Colors.white70 : Colors.black45,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
