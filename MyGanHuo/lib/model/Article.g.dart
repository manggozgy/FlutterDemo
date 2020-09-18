// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['category'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['hot'] as String,
    json['status'] as int,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'category': instance.category,
      'data': instance.data,
      'hot': instance.hot,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['_id'] as String,
    json['author'] as String,
    json['category'] as String,
    json['createdAt'] as String,
    json['desc'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['likeCounts'] as int,
    json['publishedAt'] as String,
    json['stars'] as int,
    json['title'] as String,
    json['type'] as String,
    json['url'] as String,
    json['views'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'createdAt': instance.createdAt,
      'desc': instance.desc,
      'images': instance.images,
      'likeCounts': instance.likeCounts,
      'publishedAt': instance.publishedAt,
      'stars': instance.stars,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
      'views': instance.views,
    };
