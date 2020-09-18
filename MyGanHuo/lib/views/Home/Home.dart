import 'package:flutter/material.dart';
import './HomeListView.dart';
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            leading:  IconButton(
          icon: Icon(Icons.search),
          onPressed: () {print("suosou"); },
        ),
            title: Text("最热"),
            bottom: TabBar(tabs: [
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
              HotView(),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
            ],
          ),
          ),
        length:3
        ),
      
    );
  }
}