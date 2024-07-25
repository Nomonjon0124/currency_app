part of 'currency_bloc.dart';

abstract class CurrencyEvent {
  const CurrencyEvent();
}

class GetCurrencyEvent extends CurrencyEvent{}

class GetDateCurrencyEvent extends CurrencyEvent{
  String date;
  GetDateCurrencyEvent(this.date);
}

final class ChangeLanguageEvent extends CurrencyEvent {
  final Language language;

  ChangeLanguageEvent({required this.language});
}
