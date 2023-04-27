import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../common/contants/api.dart';

class LanguageRepository {
  var box = Hive.box("authentication");
  var configBox = Hive.box("config");
  Future<void> saveLanguage(String language) async {
    try {
      final loginToken = box.get("loginToken");
      final apiUrl = configBox.get('urlSPro');
      var formBody = <String, Object>{};
      formBody['language'] = language.toLowerCase();
      final response = await http.post(
          Uri.parse(
              apiUrl + "rest/sms/latest/integration-language/changeLanguage"),
          headers: {
            HttpHeaders.contentTypeHeader:
            'application/x-www-form-urlencoded; charset=UTF-8',
            HttpHeaders.acceptHeader: 'application/json',
            // tokenName: '$loginToken'
          },
          body: formBody);
      if (response.statusCode == 200) {
        final extractData =
        json.decode(const Utf8Decoder().convert(response.bodyBytes))
        as Map<String, dynamic>;
        if (extractData['ResultCode'] == 200) {
          // logger.i("OK");
        }
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<String> getDefaultLanguageOfSystem() async {
    String language = "";
    try {
      final languageConfig = configBox.get('language');
      // String locale = Intl.getCurrentLocale();
      if (languageConfig == null) {
        language = Intl.getCurrentLocale();
      } else {
        language = languageConfig;
      }
    } catch (error) {
      rethrow;
    }
    return language;
  }

  Future<String> getDefaultLanguageFromApi() async {
    try {
      String? loginToken = box.get("loginToken");
      String? urlSPro = configBox.get('urlSPro');
      if (loginToken == null) return 'en';
      http.Response response = await http.get(
        Uri.parse('$urlSPro${GET_LANGUAGE}'),
        headers: {
          HttpHeaders.contentTypeHeader:
          'application/x-www-form-urlencoded; charset=UTF-8',
          HttpHeaders.acceptHeader: 'application/json',
          // tokenName: loginToken
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> extractData =
        json.decode(const Utf8Decoder().convert(response.bodyBytes));
        String language = extractData['language'] ?? 'en';
        return language;
      }
    } catch (error) {
      rethrow;
    }
    return "en";
  }
}
