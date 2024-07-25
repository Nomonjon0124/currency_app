import 'package:currenci_app/data/repository/currency_repository.dart';
import 'package:currenci_app/data/source/local/shared_preferences_helper.dart';
import 'package:currenci_app/data/source/remote/service/api_service_impl.dart';
import 'package:currenci_app/utils/language.dart';
import 'package:dio/dio.dart';

import '../source/remote/response/currency_response.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  final apiService = ApiServiceImpl();

  @override
  Future<List<CurrencyModel>> getCurrency() async {
    try {
      final result = await apiService.getCurrency();
      return result;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getDataCurrency(String date) async {
    try {
      final result = await apiService.getDataCurrency(date);
      return result;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<void> setLanguage(Language language) async {
    await SharedPreferencesHelper.setLanguage(language);
  }
}
