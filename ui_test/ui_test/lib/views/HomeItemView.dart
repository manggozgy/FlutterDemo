import 'package:flutter/material.dart';
import 'package:ui_test/Model.dart';

class HomeItemView extends StatelessWidget {
  final Subjects model;
  final int rank;

  const HomeItemView({this.model, this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Rank(rank: rank),
        ],
      ),
    );
  }
}

class Rank extends StatelessWidget {
  final int rank;

  const Rank({this.rank, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text("No.$rank",style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36))),
    );
  }
}

class Midde

