import 'package:flutter/material.dart';

class FirstPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Make sure each sceeen/class has the same scaffold unless you want different titles on differnt pages
    return Scaffold(
      appBar: AppBar(
      elevation: 10.0,
      title: Center(child: Text('My Title'),),
      actions: <Widget>[Icon(Icons.settings)],
    ),
        body: Material(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.purple,
                  child: Text(
                    "Expanded",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.yellow,
                  child: Text(
                    "Flexible",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  color: Colors.yellow,
                  child: Text(
                    "Flexible",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.yellow,
                  child: Text(
                    "Flexible",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.purple,
                  child: Text(
                    "Expanded",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                  child: Text(
                    "Expanded",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.orange,
                  child: Text(
                    "Expanded flex: 1",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.orange,
                  child: Text(
                    "Expanded flex: 3",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          // this takes you to screen 2
          GestureDetector(
            child: Padding(
              child: Text('Click me for next page',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              padding: EdgeInsets.all(30),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/screen2');
              },
            ),
          ],
        ),
      ),
    );
  } // Widget
} // FirstPageClass
