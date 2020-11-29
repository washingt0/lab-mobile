// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session()
    ..sessionID = json['session_id'] as String
    ..userID = json['user_id'] as String
    ..userName = json['user_name'] as String
    ..username = json['username'] as String
    ..expiresAt = json['exp'] as int;
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'session_id': instance.sessionID,
      'user_id': instance.userID,
      'user_name': instance.userName,
      'username': instance.username,
      'exp': instance.expiresAt,
    };
