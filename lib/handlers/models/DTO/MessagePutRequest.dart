import 'package:json_annotation/json_annotation.dart';

part 'MessagePutRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MessagePutRequest {
  String userID;
  String lobbyID;
  String messageText;

  MessagePutRequest({
    required this.userID,
    required this.lobbyID,
    required this.messageText,
  });

  factory MessagePutRequest.fromJson(Map<String, dynamic> json) =>
      _$MessagePutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MessagePutRequestToJson(this);
}
