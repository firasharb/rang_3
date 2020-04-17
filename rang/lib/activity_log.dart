import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

    QuerySnapshot qn = await firestore.collection("assets").getDocuments();
    return qn.documents;

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
                    subtitle: Text("The age of this person is: ${snapshot.data[index].data['age']}"),
                    leading: CachedNetworkImage(
                      imageUrl: snapshot.data[index].data['image_url'],
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                );

            });
          }
      }),
    );
  }
}




// class ActivityList extends StatelessWidget { // list
//   final activity = ["Motion detected at 12:30","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
//    "Motion detected at 8:00", "Ring at 8:00"];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: activity.length,
//       itemBuilder: (context, index){
//         return ListTile(
//           title: Text(activity[index]),
//           onTap: (){},
//         );
//       },
//       separatorBuilder: (context, index){
//         return Divider();
//       },
//     );
//   }
// }