// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LobbyPutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LobbyPutRequest _$LobbyPutRequestFromJson(Map<String, dynamic> json) =>
    LobbyPutRequest(
      name: json['name'] as String,
      userIDs:
          (json['userIDs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LobbyPutRequestToJson(LobbyPutRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userIDs': instance.userIDs,
    };
