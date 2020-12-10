//  import 'dart:web_gl';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        title: "My Flutter app",
        home: Scaffold(
            appBar: AppBar(
              title: Text('My Title'),
            ),
            body: Text(
              'This is my text',
              textDirection: TextDirection.ltr,
            )) // Scaffold
        ), // MaterialApp
  ); // runApp
} // main
