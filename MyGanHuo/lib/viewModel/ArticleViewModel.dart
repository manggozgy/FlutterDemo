import 'package:MyGanHuo/viewModel/BaseViewModel.dart';
import 'package:MyGanHuo/api/DioManger.dart';
import 'package:MyGanHuo/api/JKApi.dart';
import 'package:MyGanHuo/api/JKMethod.dart';
import 'package:MyGanHuo/model/Article.dart';

class ArticleViewModel extends BaseViewModel {
  Article article;
  void getArticles()  {
    loding(true);
     DioManager().requestList(
        JKMethod.GET, "${JKApi.hot}/views/category/Article/count/1",
        success: (data) {
          article = Article.fromJson(data);
          print(article.data[0].desc);
      loding(false);
      
    }, error: (error) {});
  }
}
