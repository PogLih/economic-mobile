import 'package:economic/presentation/view/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presentation/view/home.dart' as oldHome;
import '../presentation/login/view/login_page.dart';
import '../presentation/register/view/register_page.dart';
import '../presentation/homePage/view/home_page.dart';
import '../presentation/view/splash_page.dart';

final routes = {
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  HomePage.routeName: (context) => HomePage(),
  WelcomePage.routeName: (context) => WelcomePage(),
  SplashPage.routeName: (context) => SplashPage(),
  oldHome.HomePage.routeName: (context) => oldHome.HomePage(),
};

Route<void> splashRoute() {
  return MaterialPageRoute<void>(builder: (_) => SplashPage());
}
