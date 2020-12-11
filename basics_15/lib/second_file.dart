import 'dart:math';
import 'package:basics_15/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      // This column contains two containers
      child: Column(
        // MainAxisAlignment options are .spceBetween, .spaceAround, .spaceEvenly, .center, .end, .start
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: Colors.yellow,
            height: 400,
            width: 250,
          ),
          Container(
            color: lightPurpleColor,
            height: 400,
            width: 250,
          )
        ]
      )
    );
  } // Widget


} // SecondClass
