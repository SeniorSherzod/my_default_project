import 'package:my_default_project/data/models/sender_model.dart';

class TransactionsModel {
  final int transactionCode;
  final String date;
  final int incomeId;
  final int amount;
  final int cardId;
  final SenderModel sender;

  TransactionsModel({
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
    required this.sender,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: json['date'] as String? ?? '',
      incomeId: json['income_id'] as int? ?? 0,
      amount: json['amount'] as int? ?? 0,
      cardId: json['card_id'] as int? ?? 0,
      sender: SenderModel.fromJson(json['sender'] as Map<String, dynamic>? ?? {}),
    );
  }
}
