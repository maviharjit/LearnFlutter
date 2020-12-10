import 'dart:math';

import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.yellow,
        child: Center(
            child: Text(
          'A random number between 0 and 20 is ${generateNumber()}',
          textDirection: TextDirection.ltr,
        )));
  }

  // return a random number between 0 and 20
  int generateNumber() {
    var r = Random();
    int i = r.nextInt(20);
    return i;
  }
}
