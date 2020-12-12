import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:basics_19/first_screen.dart';


void main() {
  runApp(MyClass());
} // main

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter app",
        home: Scaffold(
            body: SecondClass()
        )
    );
  } // Widget

} // MyClass
