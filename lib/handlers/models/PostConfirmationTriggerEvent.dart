import 'package:json_annotation/json_annotation.dart';

part 'PostConfirmationTriggerEvent.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PostConfirmationTriggerEvent {
  final String version;
  final String region;
  final String userPoolId;
  final String userName;
  final String triggerSource;
  final Map<String, dynamic> request;
  final Map<String, dynamic> response;

  PostConfirmationTriggerEvent({
    required this.version,
    required this.region,
    required this.userPoolId,
    required this.userName,
    required this.triggerSource,
    required this.request,
    required this.response,
  });

  factory PostConfirmationTriggerEvent.fromJson(Map<String, dynamic> json) =>
      _$PostConfirmationTriggerEventFromJson(json);

  Map<String, dynamic> toJson() => _$PostConfirmationTriggerEventToJson(this);
}
