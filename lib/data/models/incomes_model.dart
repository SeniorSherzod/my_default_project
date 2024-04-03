import 'package:my_default_project/data/models/transfer_data.dart';

class TransactionModel{
  final String transferDate;
  final List<DataModel> transfersData;

  TransactionModel({
    required this.transferDate,
    required this.transfersData,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    transferDate: json['transfer_date'] as String? ?? "",
    transfersData: List<DataModel>.from(json['data'].map((x) => DataModel.fromJson(x))),
  );
}