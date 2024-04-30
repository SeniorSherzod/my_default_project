import 'package:local_update/currency_model.dart';
import 'local_database.dart';

Future<void> updateLocalDB(CurrencyModel currencyModel) async{
  await LocalDatabase.updateCurrency(currencyModel: currencyModel);
}