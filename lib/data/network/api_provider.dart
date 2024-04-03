import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_default_project/data/models/incomes_model.dart';
import 'package:my_default_project/data/models/network_responce.dart';

import '../models/transactions_model.dart';

class ApiProvider {
  static Future<NetworkResponse> getTranfers() async{
    try {
      http.Response response = await http
          .get(Uri.parse("https://banking-api.free.mockoapp.net/transactions-incomes"));

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => TransactionModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return NetworkResponse(errorText: "Noma'lum xatolik");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}