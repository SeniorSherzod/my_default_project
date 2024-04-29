// Events
import '../../data/models/message_chat_model/message_chat.dart';

//

// States
class ChatState {
  final List<Message> messages;
  final bool isLoading;
  final String error;

  const ChatState({
    required this.messages,
    required this.isLoading,
    required this.error,
  });

  factory ChatState.initial() => const ChatState(
    messages: [],
    isLoading: false,
    error: '',
  );

  ChatState copyWith({
    List<Message>? messages,
    bool? isLoading,
    String? error,
  }) =>
      ChatState(
        messages: messages ?? this.messages,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
