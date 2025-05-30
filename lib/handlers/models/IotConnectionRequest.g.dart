// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IotConnectionRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IotConnectionRequest _$IotConnectionRequestFromJson(
        Map<String, dynamic> json) =>
    IotConnectionRequest(
      cognitoIdentityID: json['cognitoIdentityID'] as String?,
    );

Map<String, dynamic> _$IotConnectionRequestToJson(
        IotConnectionRequest instance) =>
    <String, dynamic>{
      if (instance.cognitoIdentityID case final value?)
        'cognitoIdentityID': value,
    };
