// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessagePutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePutRequest _$MessagePutRequestFromJson(Map<String, dynamic> json) =>
    MessagePutRequest(
      userID: json['userID'] as String,
      lobbyID: json['lobbyID'] as String,
      messageText: json['messageText'] as String,
    );

Map<String, dynamic> _$MessagePutRequestToJson(MessagePutRequest instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'lobbyID': instance.lobbyID,
      'messageText': instance.messageText,
    };
