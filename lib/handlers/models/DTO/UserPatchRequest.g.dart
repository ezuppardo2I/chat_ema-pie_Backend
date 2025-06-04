// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPatchRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPatchRequest _$UserPatchRequestFromJson(Map<String, dynamic> json) =>
    UserPatchRequest(
      userID: json['userID'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      avatarImage: json['avatarImage'] as String,
      lobbiesIDs: (json['lobbiesIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserPatchRequestToJson(UserPatchRequest instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'email': instance.email,
      'username': instance.username,
      'avatarImage': instance.avatarImage,
      'lobbiesIDs': instance.lobbiesIDs,
    };
