import 'package:json_annotation/json_annotation.dart';

part 'UserPatchRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserPatchRequest {
  String userID;
  String email;
  String avatarImage;
  List<String> lobbiesIDs;

  UserPatchRequest({
    required this.userID,
    required this.email,
    required this.avatarImage,
    required this.lobbiesIDs,
  });

  factory UserPatchRequest.fromJson(Map<String, dynamic> json) =>
      _$UserPatchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserPatchRequestToJson(this);
}
