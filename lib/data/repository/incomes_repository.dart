

import '../models/network_responce.dart';
import '../network/api_provider.dart';

class IncomeRepository {
  Future<NetworkResponse> getIncomes() async {
    return ApiProvider.getTranfers();
  }
}