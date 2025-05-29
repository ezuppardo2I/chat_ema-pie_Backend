// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userID: json['userID'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatarImage: json['avatarImage'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'username': instance.username,
      'email': instance.email,
      if (instance.avatarImage case final value?) 'avatarImage': value,
    };
