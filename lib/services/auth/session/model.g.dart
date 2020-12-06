// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session()
    ..sessionID = json['jti'] as String
    ..userID = json['sub'] as String
    ..userName = json['user_name'] as String
    ..username = json['username'] as String
    ..expiresAt = json['exp'] as int;
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'jti': instance.sessionID,
      'sub': instance.userID,
      'user_name': instance.userName,
      'username': instance.username,
      'exp': instance.expiresAt,
    };
