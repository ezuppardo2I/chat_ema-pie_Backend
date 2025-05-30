import 'package:json_annotation/json_annotation.dart';

part 'LobbyPutRequest.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class LobbyPutRequest {
  String name;
  List<String> userIDs;

  LobbyPutRequest({
    required this.name,
    required this.userIDs,
  });

  factory LobbyPutRequest.fromJson(Map<String, dynamic> json) =>
      _$LobbyPutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LobbyPutRequestToJson(this);
}
