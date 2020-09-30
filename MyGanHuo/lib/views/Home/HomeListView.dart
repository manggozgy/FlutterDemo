import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
import 'package:flutter_easyrefresh/taurus_footer.dart';
import 'package:MyGanHuo/viewModel/ArticleViewModel.dart';
import 'package:MyGanHuo/components/provider_widget.dart';

class HotView extends StatefulWidget {
  const HotView({Key key}) : super(key: key);

  @override
  _HotViewState createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  int _count = 20;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        body: EasyRefresh.custom(
          firstRefresh:true,
          header: TaurusHeader(),
          footer: TaurusFooter(),
          onRefresh: () async {
            if (mounted) {
              setState(() {
                // ArticleViewModel model =
                //     Provider.of<ArticleViewModel>(context, listen: false);
                // model.getArticles();
                context.read<ArticleViewModel>().getArticles();
              });
            }
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
                    child: _hotViews(index: index,),
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 5, color: Color(0xffe2e2e2)))),
                  );
                },
                childCount: _count,
              ),
            ),
          ],
        ),
      );
  }
}

Widget hotView() {
  print("123");

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleRow(),
      SizedBox(height: 10),
      Consumer<ArticleViewModel>(
        builder: (context, model, child) {
          var title = "123";
          if (model.article != null) {
            title = (model.article.data[0].desc);
          }
          print(model.article);
          var m = context.watch<ArticleViewModel>();
          print(m.article);
          return Text(title);
        },
      ),
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

class _hotViews extends StatelessWidget {
  int index;
  _hotViews({this.index});
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow(),
        SizedBox(height: 10),
        Consumer<ArticleViewModel>(
          builder: (context, model, child) {
            var title = "123";
            if (model.article != null) {
              title = (model.article.data[index].desc);
            }
            print("${model.article}  isis");
             
            return Text(title);
          },
        ),
        SizedBox(height: 10),
        views()
      ],
    );
  }
}


class _hotViews1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ArticleViewModel>(
        model: ArticleViewModel(),
        onReady: (model) => model.getArticles(),
        builder: (context, model, child) {
           var title = "123";
                  if (model.article != null) {
                    title = (model.article.data[0].desc);
                  }
                  print("${model.article}  isis");
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleRow(),
              SizedBox(height: 10),
              // Consumer<ArticleViewModel>(
                // builder: (context, model, child) {
                 

                 Text(title),
                // },
              // ),
              SizedBox(height: 10),
              views()
            ],
          );
        });
  }
}