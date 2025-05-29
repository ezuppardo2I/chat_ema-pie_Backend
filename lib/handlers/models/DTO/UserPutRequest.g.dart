// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPutRequest _$UserPutRequestFromJson(Map<String, dynamic> json) =>
    UserPutRequest(
      userID: json['userID'] as String,
      email: json['email'] as String,
      avatarImage: json['avatarImage'] as String?,
    );

Map<String, dynamic> _$UserPutRequestToJson(UserPutRequest instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'email': instance.email,
      if (instance.avatarImage case final value?) 'avatarImage': value,
    };
