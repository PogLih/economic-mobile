import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:economic/config/firebase/firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  static const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  signInWithGoogle() async {
    final _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? gUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;


    // final credential = GoogleAuthProvider.credential(
    //   accessToken: gAuth.accessToken,
    //   idToken: gAuth.idToken
    // );
    final credential = null;

    return credential;


    //
    // Future<void> _handleSignIn() async {
    //   try {
    //     await _googleSignIn.signIn();
    //   } catch (error) {
    //     print(error);
    //   }
    // }
    //
    // final bool isAuthorized = await _googleSignIn.canAccessScopes(scopes);
    // Future<void> _handleAuthorizeScopes() async {
    //   final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    //   if (isAuthorized) {
    //     // Do things that only authorized users can do!
    //     // _handleGetContact(_currentUser!);
    //   }
    // }
  }
}