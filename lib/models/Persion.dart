import 'package:json_annotation/json_annotation.dart';

part 'Persion.g.dart';

@JsonSerializable()
class Persion {
  Persion();

  late String name;
  late String email;
  late Map<String,dynamic> mother;
  late List friends;
  
  factory Persion.fromJson(Map<String,dynamic> json) => _$PersionFromJson(json);
  Map<String, dynamic> toJson() => _$PersionToJson(this);
}
