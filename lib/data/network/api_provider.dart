import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/card_model.dart';
import '../models/network_responce.dart';
import 'api_client.dart';

class ApiProvider extends ApiClient {
  Future<NetworkResponse> getCards() async {
    try {
      Response response = await dio.get("/api/v1/cards");
      if (response.statusCode == 200) {
        List<CardModel> cards = (response.data["items"] as List?)
            ?.map((e) => CardModel.fromJson(e))
            .toList() ??
            [];
        return NetworkResponse(data: cards);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> addCard(CardModel cardModel) async {
    try {
      Response response = await dio.post("/api/v1/cards",
          data: jsonEncode([cardModel.toJson()]));
      if (response.statusCode == 201) {
        List<CardModel> cards = (response.data["items"] as List?)
            ?.map((e) => CardModel.fromJson(e))
            .toList() ??
            [];
        cards.isNotEmpty
            ? NetworkResponse(data: cards[0])
            : NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> updateCard(CardModel cardModel) async {
    try {
      Response response = await dio.put("/api/v1/cards/${cardModel.uuid}",
          data: jsonEncode(cardModel.toJsonForUpdate()));
      if (response.statusCode == 200) {
        // If the update was successful, return the updated card
        return NetworkResponse(data: CardModel.fromJson(response.data));
      } else {
        // Handle other status codes as needed
        return NetworkResponse(errorText: "ERROR: Failed to update card");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
  }


  Future<NetworkResponse> deleteCard(String id) async {
    try {
      Response response = await dio.put(
        "/api/v1/cards",
        data: jsonEncode(
          [
            {
              "_uuid": id,
            }
          ],
        ),
      );
      if (response.statusCode == 200) {
        return NetworkResponse(data: "deleted");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }
}