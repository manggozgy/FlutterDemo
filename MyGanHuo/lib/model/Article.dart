import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:json_annotation/json_annotation.dart'; 
import 'package:provider/provider.dart';

part 'Article.g.dart';


@JsonSerializable()
  class Article extends Object with ChangeNotifier {
    List<Data> dataList;
  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'data')
  List<Data> data;


  @JsonKey(name: 'hot')
  String hot;

  @JsonKey(name: 'status')
  int status;

  Article(this.category,this.data,this.hot,this.status,){
    dataList = data;
    notifyListeners();
  }

  factory Article.fromJson(Map<String, dynamic> srcJson) => _$ArticleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'createdAt')
  String createdAt;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'images')
  List<String> images;

  @JsonKey(name: 'likeCounts')
  int likeCounts;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  @JsonKey(name: 'stars')
  int stars;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'views')
  int views;

  Data(this.id,this.author,this.category,this.createdAt,this.desc,this.images,this.likeCounts,this.publishedAt,this.stars,this.title,this.type,this.url,this.views,);
 
  factory Data.fromJson(Map<String, dynamic> srcJson) {
     return _$DataFromJson(srcJson);
  }

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
