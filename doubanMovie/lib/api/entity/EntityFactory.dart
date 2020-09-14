import 'BaseEntity.dart';

class BaseEntity<T> {
  int count;
  int start;
  T data;

  BaseEntity({this.count, this.start, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      count: json["count"],
      start: json["start"],
      // data值需要经过工厂转换为我们传进来的类型
      data: EntityFactory.generateOBJ<T>(json["subjects"]),
    );
  }
}
