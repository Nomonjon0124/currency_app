part of 'currency_bloc.dart';

class CurrencyState {
  final Status? status;
  final String? errorMessage;
  final List<CurrencyModel>? data;
  final String? date;

  CurrencyState({this.status, this.errorMessage, this.data, this.date});

  CurrencyState copyWith(
          {Status? status,
          String? errorMessage,
          List<CurrencyModel>? data,
          String? date}) =>
      CurrencyState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          data: data ?? this.data,
          date: date ?? this.date);
}
