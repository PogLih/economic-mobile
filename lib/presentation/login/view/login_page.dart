import 'package:economic/presentation/login/bloc/login_bloc.dart';
import 'package:economic/presentation/login/bloc/login_event.dart';
import 'package:economic/presentation/login/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/repository/authentication_repository/authentication_repository.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<LoginBloc>.value(
        value: LoginBloc(
            authenticationRepository:
            RepositoryProvider.of<AuthenticationRepository>(context)),
        child: const LoginForm(),
      ),
    );
  }
}
