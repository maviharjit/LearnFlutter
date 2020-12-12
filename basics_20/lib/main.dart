import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/basic.dart';
import 'package:basics_20/first_screen.dart';
import 'package:basics_20/second_screen.dart';

void main() {
  runApp(new MyClass()); // the new keyword is optional and usually skipped
} // main

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter app",
        routes: <String, WidgetBuilder> {
          '/screen1': (BuildContext context) => new SecondClass(),
          '/screen2': (BuildContext context) => new SecondPageClass(),
        },
        home: SecondClass()
    );
  } // Widget

} // MyClass
