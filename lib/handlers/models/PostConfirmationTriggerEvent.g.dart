// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostConfirmationTriggerEvent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostConfirmationTriggerEvent _$PostConfirmationTriggerEventFromJson(
        Map<String, dynamic> json) =>
    PostConfirmationTriggerEvent(
      version: json['version'] as String,
      region: json['region'] as String,
      userPoolId: json['userPoolId'] as String,
      userName: json['userName'] as String,
      triggerSource: json['triggerSource'] as String,
      request: json['request'] as Map<String, dynamic>,
      response: json['response'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PostConfirmationTriggerEventToJson(
        PostConfirmationTriggerEvent instance) =>
    <String, dynamic>{
      'version': instance.version,
      'region': instance.region,
      'userPoolId': instance.userPoolId,
      'userName': instance.userName,
      'triggerSource': instance.triggerSource,
      'request': instance.request,
      'response': instance.response,
    };
