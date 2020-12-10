import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

void main() {
  runApp(new MyClass()); // runApp
} // main

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Flutter app",
        home: Scaffold(
          appBar: AppBar(
            title: Text('My Title'),
          ),
          body: Material(
              color: Colors.yellow,
              child: Center(
                  child: Text(
                'This is my text',
                textDirection: TextDirection.ltr,
              ))),
        ));
  } // Widget

} // MyClass
