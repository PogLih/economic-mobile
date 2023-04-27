import 'dart:async';
import 'dart:convert' as convert;
import 'package:hive/hive.dart';

import '../../../common/contants/api.dart';
import 'package:http/http.dart' as http;
import 'package:economic/common/Contants/common.dart';
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final userBox = Hive.box(AUTHENTICATION_BOX);
  @override
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<bool> logIn({
    required String username,
    required String password,
  }) async {
    var url = Uri.https(USER_SERVICE_BASE_URL,SIGN_IN_API);
    var obj = {
      EMAIL: username,
      PASSWORD: password
    };
    var jsonBody = convert.jsonEncode(obj);
    var response = await http.post(url, headers: HEADER, body:jsonBody);
    if(response.statusCode == 200) {
      userBox.put(EMAIL, username);
      return true;
    }
    else
      return false;
  }

  @override
  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  void dispose() => _controller.close();
}
