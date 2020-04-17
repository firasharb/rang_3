import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class PlayVideo extends StatefulWidget {
  //This will be the Url of the video that we want to pla y
  final VideoPlayerController videoPlayerController;
  final bool looping; 

  //Constructor
  PlayVideo({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override 
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      //Calling and setting videoplayercontroller to above statefulWidget
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      //Making it so that the video initializes when the app lauches 
      autoInitialize: true,
      looping: widget.looping,

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );  
      },
    );
  }

  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chewie(
          controller: _chewieController,
        ), 
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //This will dispose of any unecessary data
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }


}