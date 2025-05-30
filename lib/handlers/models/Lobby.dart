import 'package:json_annotation/json_annotation.dart';

part 'Lobby.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Lobby {
  String lobbyID;
  String name;
  List<String> userIDs;

  Lobby({
    required this.lobbyID,
    required this.name,
    required this.userIDs,
  });

  factory Lobby.fromJson(Map<String, dynamic> json) => _$LobbyFromJson(json);

  Map<String, dynamic> toJson() => _$LobbyToJson(this);
}
