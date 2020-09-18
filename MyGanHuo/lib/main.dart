import 'package:flutter/material.dart';
import './components/TabbarItem.dart';
import './views/Home/Home.dart';
import './views/Profile/Profile.dart';
import './views/Girl/Girl.dart';
import './views/Category/Category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStackPage(),
      theme: ThemeData(
          primaryColor: Colors.blue[400],
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
            TabbarItemss(Icon(Icons.home), "最热"),
            TabbarItemss(Icon(Icons.category_rounded), "分类"),
            TabbarItemss(Icon(Icons.pets), "妹纸"),
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
          children: [Home(),Category(),Girl(),Profile()],
        ));
  }
}
