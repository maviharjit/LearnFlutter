import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.yellow,
        child: Center(
            child: Text(
          'This is displayed by SecondClass',
          textDirection: TextDirection.ltr,
        )));
  }
}
