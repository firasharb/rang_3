import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'services/play_video.dart';

class ActivityEvent {
  String date;
}


class ActivityLog extends StatelessWidget { // page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override 
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Future getData() async {

    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("latest").getDocuments();
    return qn.documents;

  }

  navigateToFullSizeImage(DocumentSnapshot post) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FullSizeImage(post: post, )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {

                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].data['name']),
                    leading: CachedNetworkImage(
                      imageUrl: snapshot.data[index].data['image_url'],
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                      onTap: () => navigateToFullSizeImage(snapshot.data[index]),
                  ),
                );

            });
          }
      }),
    );
  }
}

class FullSizeImage extends StatefulWidget {

  final DocumentSnapshot post;

  FullSizeImage({ this.post });

  @override
  _FullSizeImageState createState() => _FullSizeImageState();
}

class _FullSizeImageState extends State<FullSizeImage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data['name']),
      ),
      body: Center(
        child: Container(
          child: PlayVideo(
            videoPlayerController: VideoPlayerController.network(
              widget.post.data['video_url'],
            ),
          ),
        ),
      ),
    );
  }
}