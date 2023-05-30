import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';

class InputPasswordField extends StatefulWidget {
  String text;
  TextEditingController? controller;
  var passwordVisible;
  InputPasswordField({required this.text,required this.controller,required this.passwordVisible});

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          TextField(
            style: const TextStyle(color: Colors.black),
            onChanged: (password) {
              context
                  .read<LoginBloc>()
                  .add(LoginPasswordChanged(password));
            },
            obscureText: widget.passwordVisible,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.passwordVisible = !widget.passwordVisible;
                  });
                },
                icon: widget.passwordVisible
                    ? Icon(Icons.visibility_off,
                    color: Colors.black)
                    : Icon(Icons.visibility,
                    color: theme.colorScheme.primary),
              ),
              border: UnderlineInputBorder(),
              // labelText: AppLocalizations.of(context)!.password,
            ),
          ),
        ],
      ),
    );
  }
}
