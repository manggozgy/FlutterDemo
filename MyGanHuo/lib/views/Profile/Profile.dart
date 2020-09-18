import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text("我的"),),
        body: Text("123"),
      ),
    );
    
  }

}

