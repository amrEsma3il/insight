import 'package:flutter/material.dart';

import 'custom_text_style.dart';




// ignore: must_be_immutable
class CustomButtonSignIn extends StatelessWidget {
  String? txt;
  VoidCallback? onPressed;
  final double? width;
  CustomButtonSignIn({super.key, required this.txt, required this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width:width??MediaQuery.of(context).size.width-50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
          child: Text(txt!, style: txtButton(),)),
    );
  }
}
