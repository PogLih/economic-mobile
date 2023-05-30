import 'package:economic/presentation/welcome/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presentation/login/login_page.dart';
import '../presentation/homePage/home.dart' as oldHome;
import '../presentation/register/register_page.dart';
import '../presentation/homePage/home_page.dart';
import '../presentation/splash/splash_page.dart';
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
