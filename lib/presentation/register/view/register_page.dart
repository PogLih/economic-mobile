import 'package:economic/data/repository/user_repository/user_repository.dart';
import 'package:economic/presentation/register/view/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});



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
