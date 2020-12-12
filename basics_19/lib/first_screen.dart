import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:basics_19/util.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  // define _formKey to uniquely identify the Form
  final _formKey = GlobalKey<FormState>();

  // variables to hold form field values
  String name = '';
  int age = 0;
  String password = '';
  // String selectedLocation = '';
  String selectedLocation;
  String maritalStatus = 'Single';
  bool termsChecked = true;
  List<String> locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Center(child: Text('My Title')),
        actions: <Widget>[Icon(Icons.settings)],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Name', hintText: 'Enter Name'),
                    maxLength: 50,
                    // validator to validate user input
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter a name';
                    },
                    // save the form field values to variables
                    onSaved: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Age', hintText: 'Enter Age'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) return 'Enter Age';
                      },
                      onSaved: (value) {
                        setState(() {
                          age = int.tryParse(value);
                        });
                      }),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password', hintText: 'Enter Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) return 'Enter Password';
                        if (value.length < 8) {
                          return 'Password length must be greater than 8';
                        }
                        ;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      }),
                  DropdownButton(
                      hint: Text('Please choose your city'),
                      value: selectedLocation,
                      //value: locations.first,
                      items: locations.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedLocation = newValue;
                        });
                      }),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<String>(
                            title: const Text('Single'),
                            value: 'single',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                            title: const Text('Married'),
                            value: 'married',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: termsChecked,
                      // why new Text() instead of just Text()
                      title: new Text('Sign up for our Newsletter'),
                      onChanged: (value) {
                        setState(() {
                          termsChecked = value;
                        });
                      }),
                  new RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('Register'),
                    onPressed: () {
                      onPressedSubmit(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } //Widget build

  void onPressedSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print("Name " + name);
      print("Age " + age.toString());
      print("Password " + password);
      print("City " + selectedLocation);
      print("Marital Status " + maritalStatus);
      print("Term Checked " + termsChecked.toString());
    }
  }
} // _SecondClassState
