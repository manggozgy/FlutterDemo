import 'package:flutter/material.dart';

class DragRow extends StatefulWidget {
  @override
  _DragRowState createState() => _DragRowState();
}

class _DragRowState extends State<DragRow> {
  final boxesColor = [
    Colors.blue[100],
    Colors.blue[300],
    Colors.blue[500],
    Colors.blue[700],
    Colors.blue[900],
  ];

  _shuffle() {
    setState(() {
      boxesColor.shuffle();
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
        child: Stack(
          children: List.generate(boxesColor.length, (index) {
            return Box(
              color:boxesColor[index],
              x:index * 50.0,
              y:200,
              onDrag:(Color color) {
                final index = boxesColor.indexOf(color);
                print("color at $index");
                Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    final temp = boxesColor[2];
                    boxesColor[2] = boxesColor[3];
                    boxesColor[3] = temp;
                  });
                });
              },
              key:ValueKey(boxesColor[index]),
            );
          }),
        ),
      ),
      appBar: AppBar(
        title: Text("game"),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({this.color, this.x, this.y, this.onDrag, Key key}) : super(key: key);

  final Color color;
  final double x, y;
  final Function(Color) onDrag;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      left: x,
      top: y,
      child: Draggable(
        child: Container(
          width: 50,
          height: 50,
          color: color,
          margin: EdgeInsets.all(5),
        ),
        feedback: Container(
            width: 50, height: 50, color: color, margin: EdgeInsets.all(5)),
        childWhenDragging:
            Container(width: 50, height: 50, margin: EdgeInsets.all(5)),
        onDragStarted: () {
          return onDrag(color);
        },
      ),
    );
  }
}
