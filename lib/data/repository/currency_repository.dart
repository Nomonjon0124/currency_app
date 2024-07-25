import 'package:currenci_app/utils/language.dart';

import '../source/remote/response/currency_response.dart';

abstract class CurrencyRepository{
  Future<List<CurrencyModel>> getCurrency();

  Future<List<CurrencyModel>> getDataCurrency(String date);

  Future<void> setLanguage(Language language);
}