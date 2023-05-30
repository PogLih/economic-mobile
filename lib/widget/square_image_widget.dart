import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SquareImage extends StatelessWidget {
  final String img;
  final Function() onTap;

  const SquareImage({super.key, required this.img,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.white)),
        child: Image.asset('assets/img/google-logo.png',height: 40,width: 40,),
      ),
    );
  }
}
