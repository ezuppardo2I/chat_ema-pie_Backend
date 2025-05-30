import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class User {
  String userID;

  String email;
  String? avatarImage;
  List<String>? lobbiesIDs;

  User({
    required this.userID,
    required this.email,
    this.avatarImage,
    this.lobbiesIDs,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
