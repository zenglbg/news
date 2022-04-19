// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin()
  ..accessToken = json['accessToken'] as String
  ..displayName = json['displayName'] as String
  ..channels =
      (json['channels'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'displayName': instance.displayName,
      'channels': instance.channels,
    };
