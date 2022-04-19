import 'package:json_annotation/json_annotation.dart';

part 'userLogin.g.dart';

@JsonSerializable()
class UserLogin {
  UserLogin();

  late String accessToken;
  late String displayName;
  late List<String> channels;
  
  factory UserLogin.fromJson(Map<String,dynamic> json) => _$UserLoginFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}
