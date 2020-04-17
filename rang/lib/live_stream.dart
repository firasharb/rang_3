//the livestream will be displayed on this widget 
//importing the necessary files
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:ssh/ssh.dart';

class StreamBox extends StatefulWidget {
  @override
  _StreamBoxState createState() => _StreamBoxState();
}

class _StreamBoxState extends State<StreamBox> {
  String _streamUrl;
  VlcPlayerController _vlcViewController;

  @override
  void initState(){
    super.initState();
    _vlcViewController = new VlcPlayerController();
  }
  final client = new SSHClient(
                  host: "192.168.1.2",
                  port: 22,
                  username: "pi",
                  passwordOrKey: "cmps253_Spring2020",);
  
  void _motioncontrol(String command) async {
    String result;
    result = await client.connect();
    if (result == "session_connected")
        result = await client.execute("python /home/pi/Desktop/ring/motion_controller.py " + command);
  }

  void _playstop(){
    setState(() {
      if (_streamUrl != null) {
        _streamUrl = null;
        _motioncontrol("stop");
      } else {
        _motioncontrol("start");
        _streamUrl = "http://cf559c8f.ngrok.io/";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _streamUrl == null
                ? Container(
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Stream Closed',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                ),
                          )
                        ]),
                      ),
                    ),
                  )
                : new VlcPlayer(
                    defaultHeight: 480,
                    defaultWidth: 640,
                    url: _streamUrl,
                    controller: _vlcViewController,
                    placeholder: Container(),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playstop,
        tooltip: 'Play/Pause',
        child: Icon(_streamUrl == null ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}

class LiveStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBox();
  }

}

