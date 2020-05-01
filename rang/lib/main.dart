import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rang/models/user.dart';
import 'package:rang/services/auth.dart';
import 'package:rang/services/cloud_messaging.dart';
import 'package:rang/wrapper.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  //_MyAppState createState() => _MyAppState();
  Widget build(BuildContext context){
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF02BB9F),
            primaryColorDark: const Color(0xFF167F67),
            accentColor: const Color(0xFF167F67), 
        ),
        ), 
    );
  }
}
