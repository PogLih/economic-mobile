import 'dart:async';

import 'package:flutter/material.dart';

import '../welcome/welcome_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/loading';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if(mounted){
        Navigator.of(context).pushNamedAndRemoveUntil(
            WelcomePage.routeName,
                (route) => true);
      }
    });
  }

  @override
  void dispose() {

    super.dispose();
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
