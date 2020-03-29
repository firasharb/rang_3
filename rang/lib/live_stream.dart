//the livestream will be displayed on this widget 
//importing the necessary files 
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';

class StreamBox extends StatefulWidget {
  @override
  _StreamBoxState createState() => _StreamBoxState();
}

class _StreamBoxState extends State<StreamBox> {
  String _streamUrl = "http://raspberrypi:8081/";
  VlcPlayerController _vlcViewController;

  @override
  void initState(){
    super.initState();
    _vlcViewController = new VlcPlayerController();
  }
  void _refresh(){
    setState(() {
      _streamUrl = "http://raspberrypi:8081/";
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body:Center(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new VlcPlayer(defaultWidth: 1024,
            defaultHeight: 768,
            url: _streamUrl, 
            controller: _vlcViewController,
            placeholder: Container(),
            )]
       )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: Icon(Icons.refresh) 
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

