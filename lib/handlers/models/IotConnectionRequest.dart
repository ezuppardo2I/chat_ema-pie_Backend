import 'package:json_annotation/json_annotation.dart';

part 'IotConnectionRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class IotConnectionRequest {
  String? cognitoIdentityID;
  IotConnectionRequest({required this.cognitoIdentityID});

  factory IotConnectionRequest.fromJson(Map<String, dynamic> json) =>
      _$IotConnectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IotConnectionRequestToJson(this);
}
