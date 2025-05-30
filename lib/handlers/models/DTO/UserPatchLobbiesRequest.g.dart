// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPatchLobbiesRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPatchLobbiesRequest _$UserPatchLobbiesRequestFromJson(
        Map<String, dynamic> json) =>
    UserPatchLobbiesRequest(
      userID: json['userID'] as String,
      lobbiesIDs: (json['lobbiesIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserPatchLobbiesRequestToJson(
        UserPatchLobbiesRequest instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'lobbiesIDs': instance.lobbiesIDs,
    };
