import 'dart:math';
import 'package:basics_15/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      // SingleChildScrollView scrolls the two Columns which are otherwise bigger than screen size
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.ac_unit),
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
      )
    );
  } // Widget


} // SecondClass
