import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/DTO/MessagePutRequest.dart';
import 'package:dart_template/handlers/models/Message.dart';
import 'package:dart_template/marshall.dart';
import 'dart:convert';
import 'package:nanoid/nanoid.dart';

Future<AwsApiGatewayResponse> putMessage(
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

    final request = MessagePutRequest.fromJson(jsonDecode(event.body!));

    String messageID = nanoid();

    final newMessage = Message(
        lobbyID: request.lobbyID,
        messageID: messageID,
        userID: request.userID,
        messageText: request.messageText,
        timestamp: DateTime.now().toUtc().toIso8601String());

    await db.putItem(
      item: marshall(newMessage.toJson()),
      tableName: "chat-messages",
    );

    return AwsApiGatewayResponse(
      statusCode: 200,
      body: jsonEncode({
        "status": "ok",
        "content": newMessage.toJson(),
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
