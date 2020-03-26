import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget mainWidget = Home();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) =>
        Scaffold(
        appBar: AppBar(
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
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Activity Log'),
                onTap: () {
                  setState(() {
                    mainWidget = ActivityLog();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Live Stream'),
                onTap: () {
                  setState(() {
                    mainWidget = LiveStream();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Devices'),
                onTap: () {
                  setState(() {
                    mainWidget = Devices();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Users'),
                onTap: () {
                  setState(() {
                    mainWidget = Users();
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

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Home Page"),
        ),
      );
  }
}

class ActivityLog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Activity Log"),
        ),
    );
  }
}

class LiveStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Live Stream"),
        ),
    );
  }
}

class Devices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Text("Devices"),
          ),
    );
  }
}

class Users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Users"),
        ),
    );
  }
}
