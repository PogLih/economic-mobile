import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class UI_utils {
  static showSnackBar(context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('phong dep trai')));
  }

  static showErrorFlushBar(context, String message) {
    return Flushbar(
        icon: Icon(Icons.error, color: Colors.redAccent),
        barBlur: 10,
        backgroundColor: Colors.orange.withOpacity(0.5),
        flushbarPosition: FlushbarPosition.TOP,
        title: "Error",
        message: message,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        margin: EdgeInsets.all(10),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: Duration(seconds: 10)).show(context);
  }
}
