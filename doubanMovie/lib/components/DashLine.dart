import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  DashedLine(
      {@required this.axis,
      this.dashedWidth = 1,
      this.dashedHeight = 1,
      this.count,
      this.color = const Color(0xffaaaaaa)});

  @override
  Widget build(BuildContext context) {
    // 根据宽度计算个数
    return Flex(
      direction: this.axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(this.count, (int index) {
        return Container(
          width: dashedWidth,
          height: dashedHeight,
          color: color,
        );
      }),
    );
  }
}
