import 'dart:math';
import 'package:basics_16/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        // Lets define a Column with four rows within it, 
        //each row will have two containers (a combination of Flexible and Expanded)
        // Also try flexible.tight or flexible.loose to understand them
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // First row
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      child: Text("Expanded", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text("Flexible", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              // Second row
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text("Flexible", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.yellow,
                      child: Text("Flexible", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              // Third row
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      child: Text("Expanded", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      child: Text("Expanded", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              // Fourth row
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                      child: Text("Expanded flex: 1", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.orange,
                      child: Text("Expanded flex: 3", 
                      style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),

        ]));
  } // Widget

} // SecondClass
