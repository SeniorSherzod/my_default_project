import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../utils/constants/app_constants.dart';
import '../models/categories/categories.dart';
import '../models/network_responce.dart';
import '../models/product/product.dart';

class ApiProvider {
  static Future<NetworkResponse> fetchProductModel(int id) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("${AppConstants.singleUserApi}$id"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
            ?.map((e) => ProductModel.fromJson(e))
            .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
  static Future<NetworkResponse> fetchCategoriesModel() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse(AppConstants.baseUserApi));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
            ?.map((e) => CategoriesModel.fromJson(e))
            .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }


}
