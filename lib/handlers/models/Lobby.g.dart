// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Lobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lobby _$LobbyFromJson(Map<String, dynamic> json) => Lobby(
      lobbyID: json['lobbyID'] as String,
      userIDs:
          (json['userIDs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LobbyToJson(Lobby instance) => <String, dynamic>{
      'lobbyID': instance.lobbyID,
      'userIDs': instance.userIDs,
    };
