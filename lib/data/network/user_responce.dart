

import 'package:my_default_project/data/models/user_model/user_model.dart';

import '../models/network_responce.dart';
import 'api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<NetworkResponse> getUsers() => apiProvider.getUsers();

}