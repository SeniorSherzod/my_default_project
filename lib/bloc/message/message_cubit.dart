import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message_model.dart';
import '../../data/network/message_list.dart';
import 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(messages: allMessages));

  insertMessages({required MessageModel messageModel}) {
    List<MessageModel> message = state.messages;
    message.add(messageModel);
    emit(state.copyWith(messages: message));
  }

  removeMessages({required MessageModel messageModel}) {
    List<MessageModel> message = state.messages;
    message.remove(messageModel);
    emit(state.copyWith(messages: message));
  }

  sortMessage({required int contactId}) {
    List<MessageModel> message = state.messages.where((element) {
      if (contactId == element.messageId) {
        return true;
      }
      return false;
    }).toList();
    return message;
  }
}