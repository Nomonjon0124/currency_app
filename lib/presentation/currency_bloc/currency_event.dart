part of 'currency_bloc.dart';

abstract class CurrencyEvent {
  const CurrencyEvent();
}

class GetCurrencyEvent extends CurrencyEvent{}

class GetDateCurrencyEvent extends CurrencyEvent{
  String date;
  GetDateCurrencyEvent(this.date);
}
