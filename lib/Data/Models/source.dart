import 'package:hive/hive.dart';
part 'source.g.dart';

@HiveType(typeId: 1)
class Source extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}