import 'package:economic/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';

class LocaleProvider with ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  LocaleProvider(): _locale = const Locale('vi');

  void setLocale(Locale locale) {
    // if (L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale(){
    // _locale = null;
    notifyListeners();
  }
}
