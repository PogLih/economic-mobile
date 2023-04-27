import 'package:economic/common/route.dart';
import 'package:economic/presentation/register/bloc/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';

import '../bloc/register_bloc.dart';
import '../bloc/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController displayNameController = TextEditingController();

    return Consumer<RegisterBloc>(
        builder: (ctx, bloc, child) =>
            Padding(
              padding: EdgeInsets.all(10),
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if(state == FormzStatus.submissionSuccess){
                    Navigator.of(context).push(loginRoute()
                    );
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return ListView(
                        children: <Widget>[
                          Container(
                            child: Image.asset('assets/logo-no-background.png'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              onChanged: (username) {
                                context
                                    .read<RegisterBloc>()
                                    .add(RegisterUsernameChanged(username));
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User Name',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              onChanged: (password) {
                                context
                                    .read<RegisterBloc>()
                                    .add(RegisterPasswordChanged(password));
                              },
                              obscureText: true,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              onChanged: (displayname) {
                                context
                                    .read<RegisterBloc>()
                                    .add(
                                    RegisterDisplayNameChanged(displayname));
                              },
                              controller: displayNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Display Name',
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                child: const Text('Register'),
                                onPressed: () {
                                  context
                                      .read<RegisterBloc>()
                                      .add(const RegisterSubmitted());
                                },
                              )),
                          Container(
                            child: TextButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(loginRoute());
                              },
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ));
  }
}
