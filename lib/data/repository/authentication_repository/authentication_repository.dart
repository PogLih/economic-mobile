import 'dart:async';
import 'dart:convert' as convert;

import 'package:economic/common/contants/common.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../common/contants/api.dart';
import '../../../utils/url_utils.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final userBox = Hive.box(AUTHENTICATION_BOX);

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<bool> logIn({
    required String username,
    required String password,
  }) async {
    Uri url = UrlUtils.getUrl(SIGN_IN_API);
    var obj = {EMAIL: username, PASSWORD: password};
    var jsonBody = convert.jsonEncode(obj);
    var response = await http.post(url, headers: HEADER, body: jsonBody);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      _controller.add(AuthenticationStatus.authenticated);
      userBox.put(TOKEN, jsonResponse["data"]["jwt"]);
      return true;
    } else
      return false;
  }

  void logOut() {
    userBox.clear();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
