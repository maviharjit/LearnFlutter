import 'package:basics_17/util.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        // Lets define a Column with four rows within it, 
      child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Dog'),
                subtitle: Text('This is an animal'),
                trailing: Icon(Icons.access_alarm),
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Cat'),
                subtitle: Text('This is also an animal'),
                trailing: Icon(Icons.account_balance),
              ),
              Container(
                child: Text('Bear'),
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                child: Text('Wolf'),
                padding: EdgeInsets.all(10.0),
              ),
        ],
      ),
    );
  } // Widget
} // SecondClass