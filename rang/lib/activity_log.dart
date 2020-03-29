import 'package:flutter/material.dart';


class ActivityLog extends StatelessWidget { // page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivityList(),
    );
  }
}

class ActivityList extends StatelessWidget { // list
  final activity = ["Motion detected at 12:30","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00","Missed ring at 12:31", "Motion detected at 6:45",
   "Motion detected at 8:00", "Ring at 8:00"];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: activity.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(activity[index]),
          onTap: (){},
        );
      },
      separatorBuilder: (context, index){
        return Divider();
      },
    );
  }
}