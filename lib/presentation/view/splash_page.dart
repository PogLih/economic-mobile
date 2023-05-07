import 'dart:async';

import 'package:economic/presentation/login/view/login_page.dart';
import 'package:economic/presentation/view/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/loading';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset('assets/dragon-icon.png'),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
              child: Text(
                'Chill Dragon',
                style: Theme.of(context).textTheme.titleLarge,
              )),
           Center(
              child: CircularProgressIndicator(
            strokeWidth: 8,
            color: Theme.of(context).primaryColor,
          )),
        ],
      ),
    );
  }
}
