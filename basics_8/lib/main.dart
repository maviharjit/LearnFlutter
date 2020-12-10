import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

//void main() {
//  runApp(new MyClass()); // the new keyword is optional and usually skipped
//} // main

// the following expression function or "fat arrow" will also work since
// there is only one statement within brackets
void main() => runApp(MyClass());

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
