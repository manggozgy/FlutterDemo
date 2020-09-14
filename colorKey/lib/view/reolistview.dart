import 'package:flutter/material.dart';

class Reolistview extends StatefulWidget {
  @override
  _ReolistviewState createState() => _ReolistviewState();
}

class _ReolistviewState extends State<Reolistview> {
  final boxes = [
    Box(Colors.blue[100], UniqueKey()),
    Box(Colors.blue[300], UniqueKey()),
    Box(Colors.blue[500], UniqueKey()),
    Box(Colors.blue[700], UniqueKey()),
    Box(Colors.blue[900], UniqueKey()),
  ];

  _shuffle() {
    setState(() {
      boxes.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _shuffle();
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        
        child: ReorderableListView(
          children: boxes,
          onReorder: (int oldIdenx, int newIndex) {
            if (newIndex > oldIdenx) newIndex--;
            var temp = boxes.removeAt(oldIdenx);
            boxes.insert(newIndex, temp);
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
      appBar: AppBar(
        title: Text("game"),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box(this.color, Key key) : super(key: key);

  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      margin: EdgeInsets.all(5),
    );
  }
}
