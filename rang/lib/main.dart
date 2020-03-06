import 'package:flutter/material.dart';

import 'Constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[Menu()],
        ),
        body: Center(
          child: Text("Test"),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Menu extends StatefulWidget{
  Menu():super();
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String dropdownValue = "Activity Log";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: Constants.menu.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }
}
