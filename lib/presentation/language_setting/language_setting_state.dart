import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum LanguageSettingStatus { initial, success, failure, loading }

class LanguageSettingState extends Equatable{
  final LanguageSettingStatus status;
  final Locale locale;
  final String country;

  const LanguageSettingState({
    this.status = LanguageSettingStatus.initial,
    this.locale = const Locale('en', 'US'),
    this.country = "EN"
  });

  LanguageSettingState copyWith({
    LanguageSettingStatus? status,
    Locale ? locale,
    String ? country
  }){
    return LanguageSettingState(
      status: status ?? this.status,
      locale: locale ?? this.locale,
      country: country ?? this.country
    );
  }

  @override
  List<Object?> get props => [status, locale, country];

}