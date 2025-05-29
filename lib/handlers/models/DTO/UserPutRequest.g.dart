// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPutRequest _$UserPutRequestFromJson(Map<String, dynamic> json) =>
    UserPutRequest(
      email: json['email'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserPutRequestToJson(UserPutRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
    };
