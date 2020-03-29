//the livestream will be displayed on this widget 
//importing the necessary files 
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';

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
  void _refresh(){
    setState(() {
      if (_streamUrl != null) {
        _streamUrl = null;
      } else {
        _streamUrl = "http://raspberrypi:8081/";
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
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                background: Paint()..color = Colors.red),
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
        onPressed: _refresh,
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

