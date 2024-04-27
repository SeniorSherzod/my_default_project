import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';
import '../../bloc/chat_message/chat_bloc.dart';
import '../../bloc/chat_message/chat_event.dart';
import '../../bloc/chat_message/chat_state.dart';
import 'message_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
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
                    title: Text(state.messages[index].text,style: AppTextStyle.GilroyMedium,),
                    subtitle: Text(state.messages[index].sender,style: AppTextStyle.GilroyMedium,),
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
