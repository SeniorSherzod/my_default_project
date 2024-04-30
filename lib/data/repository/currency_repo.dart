import 'package:local_update/network_reponce.dart';

import '../models/network_responce.dart';
import '../network/api_provider.dart';

class CurrencyRepository {
  Future<NetworkResponse> getCurrencies() async {
    return ApiProvider.getCurrencies();
  }
}