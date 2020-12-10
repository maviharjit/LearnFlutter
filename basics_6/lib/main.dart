import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

void main() {
  runApp(
    MaterialApp(
      title: "My Flutter app",
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('My Title'),
        ),
        body: Center(
          child: Text(
            'This is my text',
            textDirection: TextDirection.ltr,
          ),
        ),
      ), // Scaffold
    ), // MaterialApp
  ); // runApp
} // main
