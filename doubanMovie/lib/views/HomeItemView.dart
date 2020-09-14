import 'package:flutter/material.dart';
import 'package:doubanMovie/Model.dart';
import 'package:doubanMovie/components/ImageWidget.dart';

class HomeItemView extends StatelessWidget {
  final Subjects model;
  final int rank;

  const HomeItemView({this.model, this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: Color(0xffe2e2e2)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Rank(rank: rank),
          SizedBox(height: 12),
          MovieContent(model: model),
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
      child: Text("No.$rank",
          style:
              TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36))),
    );
  }
}

class MovieContent extends StatelessWidget {
  final Subjects model;

  const MovieContent({this.model, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Row(
          children: [
            ClipRRect(
                child: ImageWidget(url: model.images.large),
                borderRadius: BorderRadius.circular(5)),
            getContentDesc(),
            Text("data")
          ],
        ));
  }

  Widget getContentDesc() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      // Icon(Icons.play_circle_filled,color: Colors.redAccent),
      // getTitle()
      getTitleWidget()
        ],
      ),
    );
  }

  Widget getTitle() {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: model.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      TextSpan(
          text: "(${model.title})",
          style: TextStyle(fontSize: 18, color: Colors.black54))
    ]));
  }

  Widget getTitleWidget() {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: "     " + model.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextSpan(
              text: "(${model.year})",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            )
          ]),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
