import '../source/remote/response/currency_response.dart';

abstract class CurrencyRepository{
  Future<List<CurrencyModel>> getCurrency();

  Future<List<CurrencyModel>> getDataCurrency(String date);
}