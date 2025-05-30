// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userID: json['userID'] as String,
      email: json['email'] as String,
      avatarImage: json['avatarImage'] as String?,
      lobbiesIDs: (json['lobbiesIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'email': instance.email,
      if (instance.avatarImage case final value?) 'avatarImage': value,
      if (instance.lobbiesIDs?.toList() case final value?) 'lobbiesIDs': value,
    };
