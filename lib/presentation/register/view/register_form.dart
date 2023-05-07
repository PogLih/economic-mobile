import 'package:economic/common/route.dart';
import 'package:economic/presentation/login/view/login_page.dart';
import 'package:economic/presentation/register/bloc/register_event.dart';
import 'package:economic/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController displayNameController = TextEditingController();

    return Consumer<RegisterBloc>(
        builder: (ctx, bloc, child) =>
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  // if(state.status == FormzStatus.submissionSuccess){
                  //   Navigator.of(context).pushNamed(LoginPage.routeName
                  //   );
                  // }else if(state.status == FormzStatus.submissionFailure){
                    UI_utils.showErrorFlushBar(context,'a');
                  // }
                },
                builder: (context, state) {
                  return BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return ListView(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height/4,
                            child: Image.asset('assets/dragon-icon.png'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child:  Text(
                              AppLocalizations.of(context)!.register,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              onChanged: (username) {
                                context
                                    .read<RegisterBloc>()
                                    .add(RegisterUsernameChanged(username));
                              },
                              controller: nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: AppLocalizations.of(context)!.email,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              onChanged: (password) {
                                context
                                    .read<RegisterBloc>()
                                    .add(RegisterPasswordChanged(password));
                              },
                              obscureText: true,
                              controller: passwordController,
                              decoration:  InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: AppLocalizations.of(context)!.password,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              onChanged: (displayname) {
                                context
                                    .read<RegisterBloc>()
                                    .add(
                                    RegisterDisplayNameChanged(displayname));
                              },
                              controller: displayNameController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: AppLocalizations.of(context)!.displayName,
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              margin: const EdgeInsets.fromLTRB(0,10,0,0),
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.app_registration_sharp),
                                    Text(AppLocalizations.of(context)!.register,style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                                onPressed: () {
                                  context
                                      .read<RegisterBloc>()
                                      .add(const RegisterSubmitted());
                                },
                              )),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.doesHaveAccount),
                                TextButton(
                                  child: Text(
                                    AppLocalizations.of(context)!.login,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(LoginPage.routeName);
                                  },
                                ),
                              ],
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
