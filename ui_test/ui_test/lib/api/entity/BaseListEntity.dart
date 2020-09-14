import 'BaseEntity.dart';

class BaseListEntity<T> {
  int count;
  int start;
  List<T> data;

  BaseListEntity({this.count, this.start, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> subjects = new List<T>();
    if (json['subjects'] != null) {
      //遍历subjects并转换为我们传进来的类型
      (json['subjects'] as List).forEach((v) {
        subjects.add(EntityFactory.generateOBJ<T>(v));
      });
    }

    return BaseListEntity(
      count: json["count"],
      start: json["msg"],
      data: subjects,
    );
  }
}
