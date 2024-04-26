import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message_chat_model/message_chat.dart';
import 'chat_event.dart';
import 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ChatBloc() : super(ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      switch (event) {
        case SendMessageEvent:
          final user = FirebaseAuth.instance.currentUser;
          if (user != null && event.messageText.isNotEmpty) {
            emit(state.copyWith(isLoading: true));
            try {
              await _firestore.collection('messages').add({
                'text': event.messageText,
                'sender': user.email,
                'timestamp': DateTime.now(),
              });
              emit(state.copyWith(isLoading: false));
            } catch (error) {
              emit(state.copyWith(isLoading: false, error: error.toString()));
            }
          }
          break;
        case LoadMessagesEvent:
          emit(state.copyWith(isLoading: true));
          try {
            final messages = await _firestore.collection('messages')
                .orderBy('timestamp', descending: true)
                .get()
                .then((snapshot) => snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList());
            emit(state.copyWith(messages: messages, isLoading: false));
          } catch (error) {
            emit(state.copyWith(isLoading: false, error: error.toString()));
          }
          break;
        case RefreshMessagesEvent:
          emit(state.copyWith(isLoading: true));
          // Add logic to refresh messages (potentially with additional criteria)
          // ...
          final refreshedMessages = await _firestore.collection('messages')
          // Add filters or sorting here (optional)
              .orderBy('timestamp', descending: true)
              .get()
              .then((snapshot) => snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList());
          emit(state.copyWith(messages: refreshedMessages, isLoading: false));
          break;
      }
    });
  }
}
