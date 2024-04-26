import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final VoidCallback sendMessage;

  const MessageInput({Key? key, required this.sendMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Type a message...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              sendMessage();
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
