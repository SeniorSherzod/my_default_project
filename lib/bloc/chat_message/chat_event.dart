import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];

  get messageText => messageText;
}

class SendMessageEvent extends ChatEvent {
  final String messageText;

   SendMessageEvent({required  this.messageText});

  @override
  List<Object?> get props => [messageText];
}

class LoadMessagesEvent extends ChatEvent {}

class RefreshMessagesEvent extends ChatEvent {}
