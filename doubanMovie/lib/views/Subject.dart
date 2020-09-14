import 'package:flutter/material.dart';
class Subject extends StatelessWidget {
  const Subject({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书影音"),
        ),
        body: Center(
          child:Text("书影音") ,
          ),
      
    );
  }
}