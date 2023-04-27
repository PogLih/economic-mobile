import 'dart:developer';

import '../../../common/contants/api.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import 'package:hive/hive.dart';
import 'package:economic/common/contants/common.dart';
class UserRepository {
  User? _user;
  final userBox = Hive.box(AUTHENTICATION_BOX);


  Future<User?> registerUser({
    required String username,
    required String password,
    required String displayname
  }) async {
    var url = Uri.https(USER_SERVICE_BASE_URL,REGISTER_API);
    var obj = {
      EMAIL: username,
      PASSWORD: password,
      FULL_NAME: displayname,
    };
    var jsonBody = convert.jsonEncode(obj);
    var response = await http.post(url, headers: HEADER, body:jsonBody);
    log(response.body);
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    if(response.statusCode == 201 || response.statusCode == 200){
      userBox.put(EMAIL, username);
      return user;
    }
    return User.empty;
  }

  @override
  // TODO: implement user
  Future<User?> get user {
    if (_user != null) return Future.value(null);
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = User(username: userBox.get(EMAIL),password: '-',displayName: '-')
    );
  }
}