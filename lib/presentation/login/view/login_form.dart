import 'package:economic/common/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

import '../bloc/login_state.dart';class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Consumer<LoginBloc>(
      builder: (ctx, bloc, child) =>
          Padding(
            padding: const EdgeInsets.all(10),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if(state.status == FormzStatus.submissionSuccess ){
                  Navigator.of(context).push(homePageRoute());
                }
                if(state.status == FormzStatus.submissionFailure) {

                }
              },
              builder: (context, state) {
                return BlocBuilder<LoginBloc, LoginState>(
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
                            'Sign in',
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
                                  .read<LoginBloc>()
                                  .add(LoginUsernameChanged(username));
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
                                  .read<LoginBloc>()
                                  .add(LoginPasswordChanged(password));
                            },
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          child: const Text(
                            'Forgot Password',
                          ),
                        ),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: Text(AppLocalizations.of(context)!.login),
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                    const LoginSubmitted());
                              },
                            )),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Does not have account?'),
                              TextButton(
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      registerRoute()
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
    );
  }
}
