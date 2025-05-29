import 'package:json_annotation/json_annotation.dart';

part 'UserPutRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserPutRequest {
  String userID;
  String email;
  String username;
  String? avatarImage;
  UserPutRequest(
      {required this.email,
      required this.username,
      this.avatarImage,
      required this.userID});

  factory UserPutRequest.fromJson(Map<String, dynamic> json) =>
      _$UserPutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserPutRequestToJson(this);
}
