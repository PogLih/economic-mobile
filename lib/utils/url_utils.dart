import '../common/contants/api.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
enum TYPE {POST,GET,PUT}
class UrlUtils{
  static String HTTPS = 'https://';
  static String HTTP = 'http://';

  static Uri getUrl(String url) {
    if(USER_SERVICE_BASE_URL.startsWith(HTTPS)){
      return Uri.https(USER_SERVICE_BASE_URL.replaceAll(HTTPS, ''),url);
    }else{
      return Uri.http(USER_SERVICE_BASE_URL.replaceAll(HTTP,''),url);
    }
  }

  static Future<void> fetchData(type,url,body) async{
    var jsonBody = convert.jsonEncode(body);
    Uri uri = await getUrl(url);
    var response = await http.post(uri, headers: HEADER, body:jsonBody);
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  }
}