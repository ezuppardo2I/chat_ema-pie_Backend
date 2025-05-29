import 'package:json_annotation/json_annotation.dart';

part 'UserPutRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserPutRequest {
  String email;
  String username;
  UserPutRequest({required this.email, required this.username});

  factory UserPutRequest.fromJson(Map<String, dynamic> json) =>
      _$UserPutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserPutRequestToJson(this);
}
