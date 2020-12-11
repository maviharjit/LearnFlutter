import 'package:basics_17/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        // Lets define a Column with four rows within it, 
      child: ListView(
            children: <Widget>[
              Text('Dog'),
              Text('Cat')
        ]
      )
    );
  } // Widget
} // SecondClass