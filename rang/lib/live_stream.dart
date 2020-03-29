//the livestream will be displayed on this widget 
//importing the necessary files 
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';


class LiveStream extends StatelessWidget {
  String _streamUrl;
  VlcPlayerController _vlcViewController = new VlcPlayerController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new VlcPlayer(defaultHeight: 480,
            defaultWidth: 640, 
            url: _streamUrl, 
            controller: _vlcViewController)
          ]
           
          
       
       
        )
      ),
    );
  }

}

