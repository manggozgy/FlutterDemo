import 'package:MyGanHuo/viewModel/BaseViewModel.dart';
import 'package:MyGanHuo/api/DioManger.dart';
import 'package:MyGanHuo/api/JKApi.dart';
import 'package:MyGanHuo/api/JKMethod.dart';
import 'package:MyGanHuo/model/Article.dart';

class ArticleViewModel extends BaseViewModel {
  Article article;
  int count = 10;
  void getArticles()  {
    loding(true);
     DioManager().requestList(
        JKMethod.GET, "${JKApi.hot}/views/category/Article/count/10",
        success: (data) {
          article = Article.fromJson(data);

      loding(false);
      
    }, error: (error) {});
  }
 void getMoreArticles()  {
    loding(true);
     DioManager().requestList(
        JKMethod.GET, "${JKApi.hot}/views/category/Article/count/${count+=10}",
        success: (data) {
         Article temp =  Article.fromJson(data);
         temp.data.removeRange(1, 10);
        article.data.addAll(temp.data);
      
      loding(false);
      
    }, error: (error) {});
  }
}
