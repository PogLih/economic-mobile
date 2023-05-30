
import 'package:economic/presentation/login/login_form.dart';
import 'package:economic/widget/responsiveLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/repository/authentication_repository/authentication_repository.dart';
import '../../blocs/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Provider<LoginBloc>.value(
        value: LoginBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context)),
        child:  LoginForm(),
      ),
    );
  }
}
