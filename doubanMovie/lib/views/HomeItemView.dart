import 'package:flutter/material.dart';
import 'package:doubanMovie/Model.dart';
import 'package:doubanMovie/components/ImageWidget.dart';
import 'package:doubanMovie/components/DashLine.dart';
import 'package:doubanMovie/components/RatingBar.dart';

class HomeItemView extends StatelessWidget {
  final Subjects model;
  final int rank;

  const HomeItemView({this.model, this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: Color(0xffe2e2e2)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Rank(rank: rank),
          SizedBox(height: 12),
          MovieContent(model: model),
          Text(model.warning)
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                child: ImageWidget(url: model.images.large),
                borderRadius: BorderRadius.circular(5)),
                SizedBox(
              width: 10,
            ),
            getContentDesc(),
            SizedBox(
              width: 10,
            ),
            getDashLine(),
            SizedBox(
              width: 10,
            ),
            wishToWatch()
          ],
        ));
  }

  Widget getContentDesc() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTitleW(),
         getRatingStar(),
          getCasts()
        ],
      ),
    );
  }

  Widget getTitle() {
    //文字行数过多会导致图标无法放在顶部
    return Row(
      children: [
        Icon(Icons.play_circle_outline, color: Colors.redAccent),
        Expanded(
          child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: model.title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "(${model.year})",
                    style: TextStyle(fontSize: 18, color: Colors.black54))
              ]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Widget getTitleW() {
    //Stack测试
    return Stack(
      children: <Widget>[
        Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: model.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextSpan(
                text: "(${model.year})",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              )
            ]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
//---------------------------导演演员组件----------------

  Widget getCasts() {
    final genres = model.genres.join(" ");
    final directors = model.directors.first.name;
    String casts = "";
    for (var item in model.casts) {
      casts = casts + " " + item.name;
    }
    return Text(
      "$genres / $directors/$casts",
      style: TextStyle(fontSize: 16),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

//-------------------想看-------------------------
  Widget wishToWatch() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Icon(
          Icons.add_to_home_screen,
          color: Color.fromARGB(255, 235, 170, 60),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "想看",
          style:
              TextStyle(color: Color.fromARGB(255, 235, 170, 60), fontSize: 16),
        )
      ],
    );
  }

//---------------------------虚线----------------
  Widget getDashLine() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 100,
      width: 1,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 5,
        count: 12,
      ),
    );
  }
//---------------------------评星组件----------------
  Widget getRatingStar(){
    return Row(children: [
       RatingBar(
         selectAble:false,
            onRatingUpdate: (value) {
              print(value);
            },
            nomalImage: './assets/images/star_nomal.png',
            selectImage: './assets/images/star.png',
            maxRating: 10,
            value: model.rating.average,
            ),
            SizedBox(width: 5,),
            Text("${model.rating.average}")
    ],);
  }
}
