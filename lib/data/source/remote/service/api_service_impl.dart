import 'package:currenci_app/data/source/remote/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../response/currency_response.dart';

class ApiServiceImpl extends ApiService {
  final _dio = Dio(BaseOptions(
      baseUrl: 'https://cbu.uz/uz/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      contentType: 'application/json'));

  @override
  Future<List<CurrencyModel>> getCurrency() async {
    try {
      _dio.interceptors.add(TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
              printRequestData: true,
              printRequestHeaders: true,
              printResponseData: true,
              printResponseHeaders: true,
              printResponseMessage: true)));
      final response = await _dio.get('arkhiv-kursov-valyut/json');
      return (response.data as List)
          .map((value) => CurrencyModel.fromJson(value))
          .toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getDataCurrency(String date) async {
    try{
      _dio.interceptors.add(TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
              printRequestData: true,
              printRequestHeaders: true,
              printResponseData: true,
              printResponseHeaders: true,
              printResponseMessage: true)));
      final response = await _dio
          .get('arkhiv-kursov-valyut/json/all/$date/');
      return (response.data as List)
          .map((value) => CurrencyModel.fromJson(value))
          .toList();
    }on DioException{
      rethrow;
    }
  }
}
