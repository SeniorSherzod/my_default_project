import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final int messageId;
  final String messageText;
  final bool isFile;
  final String createdTime;
  final int contactId;
  final bool status;

  MessageModel({
    required this.createdTime,
    required this.messageText,
    required this.messageId,
    required this.isFile,
    required this.contactId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'messageText': messageText,
      'isFile': isFile,
      'createdTime': createdTime,
      'contactId': contactId,
      'status': status,
    };
  }

  factory MessageModel.fromDocument(DocumentSnapshot doc) {
    return MessageModel(
      messageId: doc.get('messageId'),
      messageText: doc.get('messageText'),
      isFile: doc.get('isFile'),
      createdTime: doc.get('createdTime'),
      contactId: doc.get('contactId'),
      status: doc.get('status'),
    );
  }
}
