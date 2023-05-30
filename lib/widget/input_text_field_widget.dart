import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
class InputTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final Function(String) onValueChanged;


  InputTextField({required this.text,required this.controller, required this.onValueChanged, });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.black),
              )),
          TextField(
            style: const TextStyle(color: Colors.black),
            onChanged: onValueChanged
            ,
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
