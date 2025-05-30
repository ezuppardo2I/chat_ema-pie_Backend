import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/DTO/LobbyPutRequest.dart';
import 'package:dart_template/handlers/models/Lobby.dart';
import 'package:dart_template/marshall.dart';
import 'dart:convert';
import 'package:nanoid/nanoid.dart';

Future<AwsApiGatewayResponse> putLobby(
  Context context,
  AwsApiGatewayEvent event,
) async {
  final corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type,Content-Encoding',
    'Access-Control-Allow-Methods': 'OPTIONS,PUT,POST,GET',
  };

  try {
    final db = DynamoDB(region: context.region!);

    final request = LobbyPutRequest.fromJson(jsonDecode(event.body!));

    final lobbyID = nanoid();

    final newLobby =
        Lobby(lobbyID: lobbyID, name: request.name, userIDs: request.userIDs);

    await db.putItem(
      item: marshall(newLobby.toJson()),
      tableName: "chat-lobbies",
    );

    return AwsApiGatewayResponse(
      statusCode: 200,
      body: jsonEncode({
        "status": "ok",
        "content": "Utente inserito correttamente",
      }),
      headers: corsHeaders,
    );
  } catch (error, stacktrace) {
    print("Error: $error");
    print("stacktrace $stacktrace");

    return AwsApiGatewayResponse(
      statusCode: 500,
      body: jsonEncode({
        "status": "ko",
        "content": {
          "error": error.toString(),
          "stacktrace": stacktrace.toString(),
        },
      }),
      headers: corsHeaders,
    );
  }
}
