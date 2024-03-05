import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants/app_constants.dart';
import '../models/network_responce.dart';
import '../models/product/product.dart';

class ApiProvider {
  static Future<NetworkResponse> getAllProducts() async {
    NetworkResponse networkResponse = NetworkResponse();
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/goods");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        return NetworkResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> addAllProducts(
      ProductModel productModel) async {
    NetworkResponse networkResponse = NetworkResponse();
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/goods");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode([productModel.toJson()]),
      );

      if (response.statusCode == 201) {
        return NetworkResponse(data: "Goods added successfully!");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> deleteAllProducts(String productId) async {
    NetworkResponse networkResponse = NetworkResponse();
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/goods");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode([{"_uuid": productId}]),
      );

      if (response.statusCode == 200) {
        return NetworkResponse(data: "Goods deleted successfully!");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> updateAllProducts(
      ProductModel productModel) async {
    NetworkResponse networkResponse = NetworkResponse();
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/goods");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode([productModel.toJson()]),
      );

      if (response.statusCode == 200) {
        return NetworkResponse(data: "Goods updated successfully!");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

}
