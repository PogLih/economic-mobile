import 'package:equatable/equatable.dart';

enum CallCenterDetailStatus { initial, success, failure, loading }
class LanguageSettingEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LanguageSettingChoose extends LanguageSettingEvent{
  final String country;

  LanguageSettingChoose(this.country);

  @override

  List<Object?> get props => [country];
}

class LanguageSettingSetDefault extends LanguageSettingEvent{
  @override

  List<Object?> get props => [];
}

class LanguageSettingGetDefault extends LanguageSettingEvent{
  @override

  List<Object?> get props => [];
}