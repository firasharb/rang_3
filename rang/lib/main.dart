import 'package:flutter/material.dart';
import 'home.dart';
import 'activity_log.dart';
import 'live_stream.dart';
import 'devices.dart';
import 'users.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
              ),
              drawer: Drawer(
                child: ListView(
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
              body: mainWidget,
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
