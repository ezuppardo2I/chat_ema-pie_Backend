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
    IotConnectionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cognitoIdentityID', instance.cognitoIdentityID);
  return val;
}
