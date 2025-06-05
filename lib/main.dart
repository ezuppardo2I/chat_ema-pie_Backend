// ignore_for_file: prefer_function_declarations_over_variables
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:dart_template/handlers/api/image/getPresigned.dart';
import 'package:dart_template/handlers/api/iot/iot_connection.dart';
import 'package:dart_template/handlers/api/lobby/GetLobby.dart';
import 'package:dart_template/handlers/api/lobby/PutLobby.dart';
import 'package:dart_template/handlers/api/message/GetMessages.dart';
import 'package:dart_template/handlers/api/message/PutMessage.dart';
import 'package:dart_template/handlers/api/user/GetUser.dart';
import 'package:dart_template/handlers/api/user/GetUsers.dart';
import 'package:dart_template/handlers/api/user/PatchUser.dart';
import 'package:dart_template/handlers/api/user/PatchUserLobbies.dart';
import 'package:dart_template/handlers/api/user/PutUser.dart';
import 'package:dart_template/handlers/models/PostConfirmationTriggerEvent.dart';

void main() async {
  final runtime = Runtime();

  runtime
      .registerEvent<PostConfirmationTriggerEvent>((Map<String, dynamic> json) {
    return PostConfirmationTriggerEvent.fromJson(json);
  });

  runtime
    ..registerHandler<PostConfirmationTriggerEvent>("main.putUser", putUser)
    ..registerHandler<AwsApiGatewayEvent>("main.getUser", getUser)
    ..registerHandler<AwsApiGatewayEvent>("main.getUsers", getUsers)
    ..registerHandler<AwsApiGatewayEvent>("main.iotConnection", iotConnection)
    ..registerHandler<AwsApiGatewayEvent>("main.patchUser", patchUser)
    ..registerHandler<AwsApiGatewayEvent>(
        "main.patchUserLobbies", patchUserLobbies)
    ..registerHandler<AwsApiGatewayEvent>("main.putLobby", putLobby)
    ..registerHandler<AwsApiGatewayEvent>("main.getLobby", getLobby)
    ..registerHandler<AwsApiGatewayEvent>("main.putMessage", putMessage)
    ..registerHandler<AwsApiGatewayEvent>("main.getMessages", getMessages)
    ..registerHandler<AwsApiGatewayEvent>("main.getPresigned", getPresigned)
    ..invoke();
}
