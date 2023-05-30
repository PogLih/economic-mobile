import 'package:economic/data/services/auth_service.dart';
import 'package:economic/utils/ui_utils.dart';
import 'package:economic/widget/input_text_field_widget.dart';
import 'package:economic/widget/square_image_widget.dart';
import 'package:economic/widget/text_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';

import '../../blocs/login/login_bloc.dart';
import '../../blocs/login/login_event.dart';
import '../../blocs/login/login_state.dart';
import '../../common/contants/assets.dart';
import '../../widget/input_password_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _passwordVisible;
  var _rememberMe;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _rememberMe = false;
  }

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
                              AppLocalizations.of(context)!.helloThere,
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
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          AppLocalizations.of(context)!
                              .pleaseEnterUsernameEmailAndPassWordToSignIn,
                          style: theme.textTheme.labelLarge?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InputTextField(
                          text: AppLocalizations.of(context)!.email,
                          controller: nameController,
                        onValueChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(LoginUsernameChanged(value));
                        },),
                      const SizedBox(height: 20),
                      InputPasswordField(
                        text: AppLocalizations.of(context)!.password,
                        controller: passwordController,
                        passwordVisible: _passwordVisible,
                      ),
                      Container(
                        child: TextButton(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (val) {
                                    setState(() {
                                      _rememberMe = val;
                                    });
                                  },
                                  checkColor: theme.colorScheme.secondary,
                                  activeColor: theme.colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.rememberMe,
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                        ),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                        ),
                      ),
                      TextDivider(
                          value: AppLocalizations.of(context)!.orContinueWith),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SquareImage(
                            img: googleLogo,
                            onTap: () {
                              AuthService().signInWithGoogle();
                            },
                          ),
                        ],
                      ),
                      Expanded(
                          child: Align(
                        // alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.login,
                                style: TextStyle(fontSize: 15),
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
