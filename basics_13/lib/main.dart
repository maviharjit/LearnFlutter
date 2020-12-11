import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:basics_13/second_file.dart';

void main() {
  runApp(new MyClass()); // the new keyword is optional and usually skipped
} // main

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter app",
        home: Scaffold(
            appBar: AppBar(
              elevation: 10.0,
              // Try hot restart if hot reload fails to update center
              title: Center(
                child: Text('My Title'),
              ),
              actions: <Widget>[Icon(Icons.settings)],
              bottom: PreferredSize(
                // Try hot restart if hot reload fails to update preferredsize
                preferredSize: Size.fromHeight(20),
                child: Text('Some Text in the AppBar'), //
              ),
            ),
            body: SecondClass()));
  } // Widget

} // MyClass
