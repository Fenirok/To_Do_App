import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  MyButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(14.5),
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      child: Text(text, style: TextStyle(fontSize: 16.5),),
    );
  }
}
