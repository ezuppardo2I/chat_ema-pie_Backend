// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPutRequest _$UserPutRequestFromJson(Map<String, dynamic> json) =>
    UserPutRequest(
      userID: json['userID'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      lobbiesIDs: (json['lobbiesIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      avatarImage: json['avatarImage'] as String?,
    );

Map<String, dynamic> _$UserPutRequestToJson(UserPutRequest instance) {
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

  writeNotNull('lobbiesIDs', instance.lobbiesIDs);
  writeNotNull('avatarImage', instance.avatarImage);
  return val;
}
