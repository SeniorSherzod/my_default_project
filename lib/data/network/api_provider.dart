import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/network_responce.dart'; // Assuming you have this file defined
import '../models/user_model/user_model.dart';
import 'api_client.dart';

class ApiProvider extends ApiClient {
  Future<NetworkResponse> getUsers() async {
    try {
      Response response = await dio.get("/api/v1/users"); // Assuming this is the endpoint to get users
      if (response.statusCode == 200) {
        List<UserModel> users = (response.data["items"] as List?)
            ?.map((e) => UserModel.fromJson(e))
            .toList() ??
            [];
        return NetworkResponse(data: users);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> addUser(UserModel userModel) async {
    try {
      Response response = await dio.post("/api/v1/users", // Assuming this is the endpoint to add a user
          data: jsonEncode([userModel.toJson()]));
      if (response.statusCode == 201) {
        List<UserModel> users = (response.data["items"] as List?)
            ?.map((e) => UserModel.fromJson(e))
            .toList() ??
            [];
        users.isNotEmpty
            ? NetworkResponse(data: users[0])
            : NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> updateUser(UserModel userModel) async {
    try {
      Response response = await dio.put("/api/v1/users/${userModel.uuid}", // Assuming this is the endpoint to update a user
          data: jsonEncode([userModel.toUpdateJson()]));
      if (response.statusCode == 200) {
        List<UserModel> users = (response.data["items"] as List?)
            ?.map((e) => UserModel.fromJson(e))
            .toList() ??
            [];
        users.isNotEmpty
            ? NetworkResponse(data: users[0])
            : NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }

  Future<NetworkResponse> deleteUser(String id) async {
    try {
      Response response = await dio.delete(
        "/api/v1/users/$id", // Assuming this is the endpoint to delete a user
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
