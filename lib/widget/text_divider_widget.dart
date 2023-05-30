import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  TextDivider({Key? key, required this.value}) : super(key: key);
  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children:  <Widget>[
            Expanded(child: Divider(endIndent: 10,)),
            Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
            Expanded(child: Divider(indent: 10 ,))
          ],
        ));
  }
}
