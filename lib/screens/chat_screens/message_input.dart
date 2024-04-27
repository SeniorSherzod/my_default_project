import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final VoidCallback sendMessage;

  const MessageInput({super.key, required this.sendMessage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Type a message...'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              sendMessage();
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
