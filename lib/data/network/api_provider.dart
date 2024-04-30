import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/currency_mode.dart';
import '../models/network_responce.dart';

class ApiProvider {
  static Future<NetworkResponse> getCurrencies() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/"));

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => CurrencyModel.fromJson(e))
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