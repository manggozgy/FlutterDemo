import 'package:flutter/material.dart';
import 'package:doubanMovie/components/TabbarItem.dart';
import 'package:doubanMovie/views/Jishi.dart';
import 'package:doubanMovie/views/Profile.dart';
import 'package:doubanMovie/views/group.dart';
import 'package:doubanMovie/views/subject.dart';

import 'views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "豆瓣",
      home: MyStackPage(),
      theme: ThemeData(
          primaryColor: Colors.green[400],
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
    );
  }
}

class MyStackPage extends StatefulWidget {
  MyStackPage({Key key}) : super(key: key);

  @override
  _MyStackPageState createState() => _MyStackPageState();
}

class _MyStackPageState extends State<MyStackPage> {
  var _currentIdenx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIdenx,
          unselectedFontSize: 14,
          selectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: [
            TabbarItemss(Icon(Icons.home), "首页"),
            TabbarItemss(Icon(Icons.personal_video), "书影音"),
            TabbarItemss(Icon(Icons.pets), "小组"),
            TabbarItemss(Icon(Icons.picture_in_picture), "市集"),
            TabbarItemss(Icon(Icons.people), "我的"),
          ],
          onTap: (int index) {
            setState(() {
              _currentIdenx = index;
            });
          },
        ),
        body: IndexedStack(
          index: _currentIdenx,
          children: [Home(), Subject(), Group(), Jishi(), Profile()],
        ));
  }
}
