import 'package:flutter/material.dart';
class Jishi extends StatelessWidget {
  const Jishi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("市集"),
        ),
        body: Center(
          child:Text("市集") ,
          ),
      
    );
  }
}