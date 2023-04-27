import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/login/view/login_page.dart';
import '../presentation/register/view/register_page.dart';
import '../presentation/view/home.dart';
import '../presentation/view/splash_page.dart';

Route<void> loginRoute() {
  return MaterialPageRoute<void>(builder: (_) => LoginPage());
}

Route<void> homePageRoute() {
  return MaterialPageRoute<void>(builder: (_) =>  HomePage());
}

Route<void> registerRoute() {
  return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
}

Route<void> splashRoute() {
  return MaterialPageRoute<void>(builder: (_) => const SplashPage());
}
