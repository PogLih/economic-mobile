import 'package:economic/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';

import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Consumer<LoginBloc>(
      builder: (ctx, bloc, child) => Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == FormzStatus.submissionFailure) {
              UI_utils.showSnackBar(context);
            }
          },
          builder: (context, state) {
            return BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              'Hello there',
                              style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            ),
                            Icon(
                              Icons.waving_hand,
                              color: theme.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Please enter username/email and password to sign in',
                          style: theme.textTheme.labelLarge?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  AppLocalizations.of(context)!.email,
                                  style: TextStyle(color: Colors.black),
                                )),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              onChanged: (username) {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginUsernameChanged(username));
                              },
                              controller: nameController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                // labelText: AppLocalizations.of(context)!.email,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                AppLocalizations.of(context)!.password,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              onChanged: (password) {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginPasswordChanged(password));
                              },
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                // labelText: AppLocalizations.of(context)!.password,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                        ),
                      ),
                      Expanded(
                          child: Align(
                        // alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                (Icons.login),
                                color: Colors.white,
                              ),
                              Text(
                                AppLocalizations.of(context)!.login,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          onPressed: () {
                            context
                                .read<LoginBloc>()
                                .add(const LoginSubmitted());
                          },
                        ),
                      )),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
