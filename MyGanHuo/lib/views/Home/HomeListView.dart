import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
import 'package:flutter_easyrefresh/taurus_footer.dart';

class HotView extends StatefulWidget {
  const HotView({Key key}) : super(key: key);

  @override
  _HotViewState createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: EasyRefresh.custom(
        header: TaurusHeader(),
        footer: TaurusFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                _count += 20;
              });
            }
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: hotView(),
                  margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 5, color: Color(0xffe2e2e2)))),
                );
              },
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }

  Widget hotView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow(),
        SizedBox(height: 10),
        Text(
            "descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc"),
        SizedBox(height: 10),
        views()
      ],
    );
  }

  Widget titleRow() {
    return Row(
      children: [
        Expanded(
            child: Text(
                "TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle")),
        SizedBox(
          width: 10,
        ),
        Text("author")
      ],
    );
  }

  Widget views() {
    return Row(
      children: [
        Text("views"),
        Text("likes"),
        Text("star"),
        Text("iOS"),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
