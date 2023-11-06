import 'package:economic/presentation/dashboard/dashboard_page.dart';
import 'package:economic/presentation/explore/explore_page.dart';
import 'package:economic/presentation/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import '../presentation/dashboard/dashboard.dart';
import '../presentation/homePage/home_page.dart';
import '../presentation/login/login_page.dart';
import '../presentation/register/register_page.dart';
import '../presentation/splash/splash_page.dart';
final routes = {
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  HomePage.routeName: (context) => HomePage(),
  WelcomePage.routeName: (context) => WelcomePage(),
  SplashPage.routeName: (context) => SplashPage(),
  DashBoard.routeName:(context) => DashboardPage(),
  ExplorePage.routeName:(context) => ExplorePage(),
};

Route<void> splashRoute() {
  return MaterialPageRoute<void>(builder: (_) => SplashPage());
}
