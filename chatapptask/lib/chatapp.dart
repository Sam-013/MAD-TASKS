import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          // Chat list view
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of messages
              itemBuilder: (context, index) {
                // Return a message bubble widget
                return MessageBubble(
                  message: 'A Message',
                  isSender: index % 2 == 0,
                );
              },
            ),
          ),
          // Text field for composing new messages
          TextField(
            decoration: InputDecoration(
              hintText: 'Type Message...',
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const MessageBubble({Key? key, required this.message, required this.isSender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSender ? Colors.blue : Colors.grey,
      ),
      child: Text(message),
    );
  }
}
