import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  String maritalStatus = 'Single';
  bool termsChecked = true;
  List<String> locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Center(child: Text('My Title')
        ),
        actions: <Widget> [
          Icon(Icons.settings)
        ],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name',hintText: 'Enter Name'),
                    maxLength: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age',hintText: 'Enter Age'),
                    // display the appropriate keyboard based on field
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password',hintText: 'Enter Password'),
                    // hide password characters
                    obscureText: true,
                  ),
                  DropdownButton(
                    hint: Text('Please choose your city'),
                    // .map created key value type data structure from items in a List
                    items: locations.map((location) {
                      return DropdownMenuItem(
                        // not sure how this is iterating without an explicit loop or iterator
                        // why new Text() instead of Text()
                        child: new Text(location),
                        value: location,
                        );
                    }).toList(), // toList converts the output to List format which is expect by items:
                  ),
                  Row(
                    // What does MainAxisSize.min do
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      // we choose expanded coz this row is within a column and not fixed
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Single'),
                          value: 'single',
                          groupValue: maritalStatus,
                        ),), 
                        Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Married'),
                          value: 'married',
                          groupValue: maritalStatus,
                        ),),
                    ],
                  ),
                  // note that onChange method is not implemented yet hence grayed out elements
                  CheckboxListTile(
                    // controlaffinity to display checking before the text instead of after it
                    controlAffinity: ListTileControlAffinity.leading,
                    value: termsChecked,
                    // why new Text() instead of just Text()
                    title: new Text('Sign up for our Newsletter'),
                  ),
                  // why new RaisedButton instead of just RaisedButton
                  // Note that onSubmit method is not implemented yet, hence grayed out button
                  new RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    // again why new Text() instead of just Text()
                    child: new Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } //Widget build
} // _SecondClassState
