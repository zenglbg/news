// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Persion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Persion _$PersionFromJson(Map<String, dynamic> json) => Persion()
  ..name = json['name'] as String
  ..email = json['email'] as String
  ..mother = json['mother'] as Map<String, dynamic>
  ..friends = json['friends'] as List<dynamic>;

Map<String, dynamic> _$PersionToJson(Persion instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mother': instance.mother,
      'friends': instance.friends,
    };
