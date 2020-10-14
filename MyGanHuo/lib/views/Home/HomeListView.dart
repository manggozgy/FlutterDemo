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

class _HotViewState extends State<HotView> with AutomaticKeepAliveClientMixin{
   EasyRefreshController _controller;
   @override
  bool get wantKeepAlive => true;

  @override
  void initState() { 
    super.initState();
     _controller = EasyRefreshController();
  }
  @override
  Widget build(BuildContext context) {
     super.build(context);
    return Scaffold(
        body: ProviderWidget<ArticleViewModel>(
            model: ArticleViewModel(),
            onReady: (model) => model.getArticles(),
            builder: (context, model, child) {
              if (context.watch<ArticleViewModel>().article != null) {
                return EasyRefresh.custom(
                  controller: _controller,
                  enableControlFinishLoad:true,
                  enableControlFinishRefresh: false,
                  firstRefresh: false,
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
                        _controller.finishLoad(noMore: context.read<ArticleViewModel>().article.data.length >= 20);
                      if (mounted) {
                        ArticleViewModel model =
                            Provider.of<ArticleViewModel>(context, listen: false);
                        if(model.isLoding){
                          _controller.finishRefresh(success: false);

                        }
                        setState(() {
                          context.read<ArticleViewModel>().getMoreArticles();

                        });
                      }
                  },
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Container(
                          child: _hotViews(
                            index: index,
                          ),
                          // child: _hotViews1(index: index,),
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 5, color: Color(0xffe2e2e2)))),
                        );
                      },
                          childCount: context
                              .watch<ArticleViewModel>()
                              .article
                              .data
                              .length),
                    ),
                  ],
                );
              }else{
                return Container(child: Text("loding"),);
              }
            }));
  }
}


Widget titleRow(int index) {
  return  Consumer<ArticleViewModel>(
          builder: (context, model, child) {
            return Row(
    children: [
      Expanded(
          child: Text(
              model.article.data[index].title)),
      SizedBox(
        width: 10,
      ),
      Text(model.article.data[index].author)
    ],
  );}
  );
}

Widget views(int index) {
  
  return Consumer<ArticleViewModel>(
          builder: (context, model, child) {
            return Row(
    children: [
      Text(model.article.data[index].views.toString()),
      Text(model.article.data[index].likeCounts.toString()),
      Text(model.article.data[index].stars.toString()),
      Text("${model.article.data[index].type}--$index"),
    ],
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  );
          });
}

class _hotViews extends StatelessWidget {
  final int index;
  _hotViews({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow(index),
        SizedBox(height: 10),
        Consumer<ArticleViewModel>(
          builder: (context, model, child) {
            var title = "";
            if (model.article != null) {
              title = (model.article.data[index].desc);
            }

            return Text(title);
          },
        ),
        SizedBox(height: 10),
        views(index)
      ],
    );
  }
}

class _hotViews1 extends StatelessWidget {
  final int index;
  _hotViews1({this.index});
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ArticleViewModel>(
        model: ArticleViewModel(),
        onReady: (model) => model.getArticles(),
        builder: (context, model, child) {
          var title = "123";
          if (model.article != null) {
            title = (model.article.data[index].desc);
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleRow(index),
              SizedBox(height: 10),
              // Consumer<ArticleViewModel>(
              // builder: (context, model, child) {

              Text(title),
              // },
              // ),
              SizedBox(height: 10),
              views(index)
            ],
          );
        });
  }
}
