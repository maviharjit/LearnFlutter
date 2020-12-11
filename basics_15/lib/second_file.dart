import 'dart:math';
import 'package:basics_15/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      // This row contains two containers
      child: Row(
        // MainAxisAlignment options are .spceBetween, .spaceAround, .spaceEvenly, .center, .end, .start
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.yellow,
            height: 500,
            width: 150,
          ),
          Container(
            color: lightPurpleColor,
            height: 500,
            width: 150,
          )
        ]
      )
    );
  } // Widget


} // SecondClass
