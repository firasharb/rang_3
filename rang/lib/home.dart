import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rang/plugins/firetop/storage/fire_storage_service.dart';

String image = "data/20:26 on 30-03-2020 .jpg";


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadFirebaseStorageImage(),
    );
  }
}

Future<Widget> _getImage(BuildContext context, String image) async {
  Image m;
  await FireStorageService.loadFromStorage(context, image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      fit: BoxFit.scaleDown,
    );

  });
  return m;
}

class LoadFirebaseStorageImage extends StatefulWidget {
  @override
  _LoadFirbaseStorageImageState createState() =>
      _LoadFirbaseStorageImageState();
}



class _LoadFirbaseStorageImageState extends State<LoadFirebaseStorageImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
          future: _getImage(context, image),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.done)
              return Container(
                height:
                MediaQuery
                    .of(context)
                    .size
                    .height / 1.25,
                width:
                MediaQuery
                    .of(context)
                    .size
                    .width / 1.25,
                child: snapshot.data,
              );

            if (snapshot.connectionState ==
                ConnectionState.waiting)
              return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height /
                      1.25,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width /
                      1.25,
                  child: CircularProgressIndicator());
            return Container();
          })));}}












