
import 'package:flutter/cupertino.dart';

class LocaleProvider with ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  LocaleProvider(): _locale = const Locale('vi');

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void clearLocale(){
    notifyListeners();
  }
}
