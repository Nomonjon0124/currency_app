import 'package:bloc/bloc.dart';
import 'package:currenci_app/data/repository/currency_repository_impl.dart';
import 'package:dio/dio.dart';

import '../../data/source/local/shared_preferences_helper.dart';
import '../../data/source/remote/response/currency_response.dart';
import '../../utils/language.dart';
import '../../utils/status.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final repository = CurrencyRepositoryImpl();

  CurrencyBloc() : super(CurrencyState.initial()) {
    on<GetCurrencyEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));
        final result = await repository.getCurrency();
        emit(state.copyWith(status: Status.success, data: result));
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.fail, errorMessage: e.message));
      }
    });

    on<GetDateCurrencyEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));
        final result = await repository.getDataCurrency(event.date);
        emit(state.copyWith(status: Status.success, data: result));
      } on DioException catch (e) {
        emit(state.copyWith(status: Status.fail, errorMessage: e.message));
      }
    });

    on<ChangeLanguageEvent>((event, emit) => _onChangeLanguageEvent(event, emit));
  }

  void _onChangeLanguageEvent(ChangeLanguageEvent event, Emitter<CurrencyState> emit) {
    emit(state.copyWith(language: event.language));
    repository.setLanguage(event.language);
  }
}
