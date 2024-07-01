import '../response/currency_response.dart';

abstract class ApiService{
  Future<List<CurrencyModel>> getCurrency();

  Future<List<CurrencyModel>> getDataCurrency(String date);
}