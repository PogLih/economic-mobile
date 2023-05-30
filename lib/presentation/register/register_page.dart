import 'package:economic/data/repository/user_repository/user_repository.dart';
import 'package:economic/presentation/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../blocs/register/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<RegisterBloc>.value(
        value: RegisterBloc( userRepository: RepositoryProvider.of<UserRepository>(context)),
        child: const RegisterForm(),
      ),
    );
  }
}
