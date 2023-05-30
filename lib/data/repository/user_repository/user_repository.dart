import 'dart:async';
import 'dart:developer';

import 'package:economic/utils/url_utils.dart';

import '../../../common/contants/api.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import 'package:hive/hive.dart';
import 'package:economic/common/contants/common.dart';

import '../authentication_repository/authentication_repository.dart';
class UserRepository {
  User? _user;
  final userBox = Hive.box(AUTHENTICATION_BOX);
  final _controller = StreamController<AuthenticationStatus>();

  Future<User?> registerUser({
    required String username,
    required String password,
    required String displayname
  }) async {
    try{
      var url = UrlUtils.getUrl(REGISTER_API);
      var obj = {
        EMAIL: username,
        PASSWORD: password,
        FULL_NAME: displayname,
      };
      var jsonBody = convert.jsonEncode(obj);
      var response = await http.post(url, headers: HEADER, body:jsonBody);
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      if(response.statusCode == 201 || response.statusCode == 200){
        _controller.add(AuthenticationStatus.authenticated);
        userBox.put(TOKEN, jsonResponse["data"]["jwt"]);
        userBox.put(REFRESH_TOKEN, jsonResponse["data"]["refreshToken"]);
        return user;
      }
    }catch (e){
      print(e);
    }
    return User.empty;
  }

  @override
  Future<User?> get user async{
    String token = userBox.get(TOKEN);
    var url = UrlUtils.getUrl(GET_USER_CURRENT_INFOMATION);
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(url,headers: header);
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    if(response.statusCode == 200){
      var fullName = jsonResponse["data"]["fullName"];
      userBox.put('id', jsonResponse["data"]["id"]);
      userBox.put('fullName', fullName);
      userBox.put('profilePicture', jsonResponse["data"]["profilePicture"]);
      return User( displayName: fullName,username: fullName,password: '-');
    }
    return null;
  }
}