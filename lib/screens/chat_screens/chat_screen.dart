import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/chat_message/chat_bloc.dart';
import '../../bloc/chat_message/chat_event.dart';
import '../../bloc/chat_message/chat_state.dart';
import 'message_input.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) => Column(
            children: [
              Expanded(
                child: state.isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.messages[index].text),
                    subtitle: Text(state.messages[index].sender),
                  ),
                ),
              ),
              MessageInput(sendMessage: () => context.read<ChatBloc>().add(SendMessageEvent(messageText: 'Your message here'))), // Pass message content
            ],
          ),
        ),
      ),
    );
  }
}
