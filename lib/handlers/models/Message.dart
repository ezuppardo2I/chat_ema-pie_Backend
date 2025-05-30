import 'package:json_annotation/json_annotation.dart';

part 'Message.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Message {
  String messageID;
  String userID;
  String lobbyID;
  String messageText;

  Message({
    required this.messageID,
    required this.userID,
    required this.lobbyID,
    required this.messageText,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
