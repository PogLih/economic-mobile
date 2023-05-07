import 'dart:io';
import 'package:economic/config/firebase/firebase_config.dart';
import 'package:economic/config/hive/hive.dart';
import 'package:economic/data/repository/authentication_repository/authentication_repository.dart';
import 'package:economic/data/repository/user_repository/user_repository.dart';
import 'package:economic/presentation/view/app.dart';
import 'package:flutter/material.dart';
import 'config/CustomHttp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await initFireBase();
  HttpOverrides.global = CustomHttpOverrides();

  runApp(App(
    userRepository: UserRepository(),
    authenticationRepository: AuthenticationRepository(),
  ));
}
