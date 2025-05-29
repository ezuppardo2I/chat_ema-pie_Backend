// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userPutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPutRequest _$UserPutRequestFromJson(Map<String, dynamic> json) =>
    UserPutRequest(
      email: json['email'] as String,
      username: json['username'] as String,
      avatarImage: json['avatarImage'] as String?,
    );

Map<String, dynamic> _$UserPutRequestToJson(UserPutRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      if (instance.avatarImage case final value?) 'avatarImage': value,
    };
