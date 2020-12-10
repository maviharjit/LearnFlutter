import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:basics_9/second_file.dart';

void main() {
  runApp(new MyClass()); // the new keyword is optional and usually skipped
} // main

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // this removes the debug flag
        debugShowCheckedModeBanner: false,
        title: "My Flutter app",
        home: Scaffold(
            appBar: AppBar(
              title: Text('My Title'),
            ),
            body: SecondClass()));
  } // Widget

} // MyClass
