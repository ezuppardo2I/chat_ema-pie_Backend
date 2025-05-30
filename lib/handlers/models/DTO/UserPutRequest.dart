import 'package:json_annotation/json_annotation.dart';

part 'UserPutRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserPutRequest {
  String userID;
  String email;
  Set<String> lobbiesIDs = {};

  String? avatarImage;
  UserPutRequest({
    required this.userID,
    required this.email,
    this.avatarImage,
  });

  factory UserPutRequest.fromJson(Map<String, dynamic> json) =>
      _$UserPutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserPutRequestToJson(this);
}
