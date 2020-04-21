import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rang/services/cloud_messaging.dart';


String image = "data/20:26 on 30-03-2020 .jpg"; //This is just to test wether the image will be displayed


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override 
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection("latest").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Text("Loading data... Please Wait.");
          } else {
            return Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  snapshot.data.documents[0]['image_url'],
                  //placeholder: (context, url) => CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}


// Future<Widget> _getImage(BuildContext context, String image) async {
//   Image m;
//   await FireStorageService.loadFromStorage(context, image).then((downloadUrl) {
//     m = Image.network(
//       downloadUrl.toString(),
//       fit: BoxFit.scaleDown,
//     );

//   });
//   return m;
// }

// class LoadFirebaseStorageImage extends StatefulWidget {
//   @override
//   _LoadFirbaseStorageImageState createState() =>
//       _LoadFirbaseStorageImageState();
// }



// class _LoadFirbaseStorageImageState extends State<LoadFirebaseStorageImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: FutureBuilder(
//           future: _getImage(context, image),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState ==
//                 ConnectionState.done)
//               return Container(
//                 height:
//                 MediaQuery
//                     .of(context)
//                     .size
//                     .height / 1.25,
//                 width:
//                 MediaQuery
//                     .of(context)
//                     .size
//                     .width / 1.25,
//                 child: snapshot.data,
//               );

//             if (snapshot.connectionState ==
//                 ConnectionState.waiting)
//               return Container(
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height /
//                       1.25,
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width /
//                       1.25,
//                   child: CircularProgressIndicator());
//             return Container();
//           })));}}












