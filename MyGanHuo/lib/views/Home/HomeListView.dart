import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class HotView extends StatefulWidget {
  const HotView({Key key}) : super(key: key);

  @override
  _HotViewState createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
       header: MaterialHeader(),
    footer: MaterialFooter(),
          child: ListView.separated(
        itemCount: 10,
        separatorBuilder:(BuildContext context, int index){
          return Divider(thickness:5,color: Color(0xffe2e2e2));
        },
        itemBuilder: (BuildContext context, int index){
          return  Container(

          margin: EdgeInsets.all(8),
          child: hotView()
        );
        },
            
      ),
      onRefresh: () async{
      
    },
    onLoad: () async {
      
    },
    );
  }

    Widget hotView(){
      return Column(
          mainAxisSize:MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [titleRow(),SizedBox(height: 10), Text("descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc"), SizedBox(height: 10),views()],
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
