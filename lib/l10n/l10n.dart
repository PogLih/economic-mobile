import 'dart:ui';

class L10n{
  static final all = [
    const Locale('vi'),
    const Locale('en')
  ];

  static String getFlag(String code){
    switch (code){
      case 'vi':
        return '🇻🇳';
        break;
      case 'en':
        return '🇦🇺';
        break;
    }
    return '';
  }
}