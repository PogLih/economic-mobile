import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/string_utils.dart';
import '../../data/repository/language_repository/language_repository.dart';
import 'language_setting_event.dart';
import 'language_setting_state.dart';

class LanguageSettingBloc
    extends Bloc<LanguageSettingEvent, LanguageSettingState> {
  final LanguageRepository _repository = LanguageRepository();
  LanguageSettingBloc() : super(const LanguageSettingState()) {
    on<LanguageSettingChoose>(_changeLanguage);
    on<LanguageSettingSetDefault>(_setDefault);
    on<LanguageSettingGetDefault>(_getDefault);
  }

  Future<void> _changeLanguage(
      LanguageSettingChoose event, Emitter<LanguageSettingState> emit) async {
    try {
      await _repository.saveLanguage(event.country);
      if (StringUtils.equalsIgnoreCase(event.country, "en")) {
        emit(state.copyWith(
            locale: const Locale('en', 'US'), country: event.country));
      } else {
        emit(state.copyWith(
            locale: const Locale('vi', 'VN'), country: event.country));
      }
    } catch (_) {}
  }

  Future<void> _setDefault(LanguageSettingSetDefault event,
      Emitter<LanguageSettingState> emit) async {
    try {
      String language = await _repository.getDefaultLanguageOfSystem();
      if (language == "EN" || language.contains('en')) {
        emit(state.copyWith(locale: const Locale('en', 'US'), country: 'EN'));
      } else {
        emit(state.copyWith(locale: const Locale('vi', 'VN'), country: 'VI'));
      }
    } catch (_) {}
  }

  Future<void> _getDefault(LanguageSettingGetDefault event,
      Emitter<LanguageSettingState> emit) async {
    try {
      String language = await _repository.getDefaultLanguageFromApi();
      if (language == "EN" || language.contains('en')) {
        emit(state.copyWith(locale: const Locale('en', 'US'), country: 'EN'));
      } else {
        emit(state.copyWith(locale: const Locale('vi', 'VN'), country: 'VI'));
      }
    } catch (_) {}
  }
}
