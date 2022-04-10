import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable(nullable: false)
class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
