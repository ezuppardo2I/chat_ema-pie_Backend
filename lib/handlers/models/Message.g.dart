// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      messageID: json['messageID'] as String,
      userID: json['userID'] as String,
      lobbyID: json['lobbyID'] as String,
      messageText: json['messageText'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'messageID': instance.messageID,
      'userID': instance.userID,
      'lobbyID': instance.lobbyID,
      'messageText': instance.messageText,
    };
