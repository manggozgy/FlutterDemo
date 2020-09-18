import 'package:flutter/material.dart';
class Category extends StatelessWidget {
  const Category({Key key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Text("分类"),
            bottom: TabBar(tabs: [
              Text("所有"),
               Text("文章"),
               Text("干货"),
               Text("妹纸"),
            ],
            indicatorColor:Colors.white,
            unselectedLabelColor:Colors.black,
            labelColor:Colors.white,

            ),
            ),
            body:  new TabBarView(
            children: [
              new Icon(Icons.directions_car),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
              new Icon(Icons.directions_bike),
            ],
          ),
          ),
        length:4
        ),
      
    );
  }
}