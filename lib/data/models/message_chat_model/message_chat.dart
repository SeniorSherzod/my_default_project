import 'package:cloud_firestore/cloud_firestore.dart';

class Message { // Optional, for more complex message data structure
  final String text;
  final String sender;
  final Timestamp timestamp;

  Message({required this.text, required this.sender, required this.timestamp});

  factory Message.fromFirestore(DocumentSnapshot doc) {
    return Message(
      text: doc['text'] as String,
      sender: doc['sender'] as String,
      timestamp: doc['timestamp'] as Timestamp,
    );
  }
}