import 'dart:math';
import 'package:basics_14/util.dart';
import 'package:flutter/material.dart';

// for alignment center is 0,0. alignment range bet 1 and -1
// can't have color and BoxDecoration at the same time
class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: lightPurpleColor,
        child: Container(
            height: 500,
            width: 300,
            alignment: Alignment(-1, -1),
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink], 
                stops: [0.2, 0.5, 0.7, 1], 
                center: Alignment(0.1, 0.3), 
                focal: Alignment(-0.1, 0.6)
              )
            ),
            child: GestureDetector(
              onTap: (){
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('It was pressed'),
                  duration: Duration(seconds: 2),
                )
                ); // showSnackBar
              }, // onTap
              // Notice the comma separated key: value pairs
              child: Text(generateNumber(),textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold))
            )
        )
    );
  } // Widget

  // return a random number between 0 and 20 as a String
  String generateNumber() {
    var r = Random();
    int i = r.nextInt(20);
    return "A random number between 0 and 20 is ${i}";
  } // generateNumber

} // SecondClass
