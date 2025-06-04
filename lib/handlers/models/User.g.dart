// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userID: json['userID'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      avatarImage: json['avatarImage'] as String?,
      lobbiesIDs: (json['lobbiesIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'userID': instance.userID,
    'email': instance.email,
    'username': instance.username,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatarImage', instance.avatarImage);
  writeNotNull('lobbiesIDs', instance.lobbiesIDs);
  return val;
}
