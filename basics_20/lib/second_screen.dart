import 'package:flutter/material.dart';

class SecondPageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              elevation: 10.0,
              // this remove the backbutton provided by android by default
              //automaticallyImplyLeading: false,
              title: Center(child: Text('My Title'),
              ),
              actions: <Widget>[Icon(Icons.settings)],
             ),
            body: Material(
              child: Column( 
                children: <Widget>[
                  Text('Screen 2'),
                    // this takes you back to screen 1
                    GestureDetector(
                      child: Center(
                        child: Padding (
                          child: Text('Take me back',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                            )),
                          padding: EdgeInsets.all(20.0),
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pop();
                      }
                    )                
                ]
            ),
        )
      );
    } // Widget
} // SecondPageClass
