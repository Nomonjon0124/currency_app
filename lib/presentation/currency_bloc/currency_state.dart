part of 'currency_bloc.dart';

class CurrencyState {
  final Status? status;
  final String? errorMessage;
  final List<CurrencyModel>? data;
  final String? date;
  final Language language;

  factory CurrencyState.initial() {
    return CurrencyState(
      language: SharedPreferencesHelper.getLanguage(),
    );
  }

  CurrencyState({this.status, this.errorMessage, this.data, this.date, required this.language});

  CurrencyState copyWith({Status? status, String? errorMessage, List<CurrencyModel>? data, String? date, Language? language}) => CurrencyState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      date: date ?? this.date,
      language: language ?? this.language);
}
