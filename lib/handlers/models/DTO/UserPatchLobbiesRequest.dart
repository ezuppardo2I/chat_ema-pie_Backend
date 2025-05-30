import 'package:json_annotation/json_annotation.dart';

part 'UserPatchLobbiesRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserPatchLobbiesRequest {
  String userID;
  List<String> lobbiesIDs;

  UserPatchLobbiesRequest({
    required this.userID,
    required this.lobbiesIDs,
  });

  factory UserPatchLobbiesRequest.fromJson(Map<String, dynamic> json) =>
      _$UserPatchLobbiesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserPatchLobbiesRequestToJson(this);
}
