import 'package:flutter/material.dart';
import 'package:rang/services/auth.dart';
import 'home.dart';
import 'activity_log.dart';
import 'live_stream.dart';
import 'devices.dart';
import 'users.dart';
import 'services/auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final AuthService _auth =  AuthService();
  Widget mainWidget = Home();
  var mainAppBarTitle = "Home";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) =>
            Scaffold(
              appBar: AppBar(
                title: Text(mainAppBarTitle),
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('logout'),
                    onPressed: () async {
                      await _auth.signOut(); 
                    },
                  )
                ],
              ),
              drawer: Drawer(
                child: SafeArea(child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      title: Text('Home'),
                      onTap: () {
                        setState(() {
                          mainWidget = Home();
                          mainAppBarTitle = "Home";
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Activity Log'),
                      onTap: () {
                        setState(() {
                          mainWidget = ActivityLog();
                          mainAppBarTitle = "Activity Log";
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Live Stream'),
                      onTap: () {
                        setState(() {
                          mainWidget = LiveStream();
                          mainAppBarTitle = "Live Stream";
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Devices'),
                      onTap: () {
                        setState(() {
                          mainWidget = Devices();
                          mainAppBarTitle = "Devices";
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Users'),
                      onTap: () {
                        setState(() {
                          mainWidget = Users();
                          mainAppBarTitle = "Users";
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              ),
              body: mainWidget, 
            ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFF167F67),
      ),
    );
  }
}
