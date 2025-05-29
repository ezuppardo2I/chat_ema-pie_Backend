import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class User {
  String userID;
  String username;
  String email;
  String? avatarImage;

  User({
    required this.userID,
    required this.username,
    required this.email,
    this.avatarImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
