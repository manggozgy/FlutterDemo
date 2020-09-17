import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:colorKey/view/reolistview.dart';
// ignore: unused_import
import 'package:colorKey/view/dragRow.dart';

import 'package:colorKey/example/routes.dart';




void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'StaggeredGridView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   final listView = Reolistview();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'colorKey',
//         theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or simply save your changes to "hot reload" in a Flutter IDE).
//           // Notice that the counter didn't reset back to zero; the application
//           // is not restarted.
//           primarySwatch: Colors.blue,
//           // This makes the visual density adapt to the platform that you run
//           // the app on. For desktop platforms, the controls will be smaller and
//           // closer together (more dense) than on mobile platforms.
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         // home: Reolistview()
//         home: DragRow(),
//         );
//   }
// }
