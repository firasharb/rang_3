import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rang/authenticate/authenticate.dart';
import 'package:rang/models/user.dart';
import 'package:rang/mainpage.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);

    //return either home or authenticate widget
    if(user==null){
      return Authenticate();
    }else{
      return MainPage();
    }

  }
}