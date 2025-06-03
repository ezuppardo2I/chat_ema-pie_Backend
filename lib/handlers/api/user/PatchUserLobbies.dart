import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/DTO/UserPatchLobbiesRequest.dart';
import 'dart:convert';

Future<AwsApiGatewayResponse> patchUserLobbies(
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

    final request = UserPatchLobbiesRequest.fromJson(jsonDecode(event.body!));

    if (request.lobbiesIDs.isEmpty) {
      return AwsApiGatewayResponse(
        statusCode: 400,
        body: jsonEncode({
          "status": "ko",
          "content": "La lista delle lobby non può essere vuota",
        }),
        headers: corsHeaders,
      );
    }

    await db.updateItem(
      key: {
        "userId": AttributeValue(s: request.userID),
      },
      tableName: "chat-users",
      updateExpression:
          "SET lobbiesIDs = list_append(if_not_exists(lobbiesIDs, :empty_list), :new_lobbies)",
      expressionAttributeValues: {
        ":new_lobbies": AttributeValue(
          l: request.lobbiesIDs.map((id) => AttributeValue(s: id)).toList(),
        ),
        ":empty_list": AttributeValue(l: []),
      },
    );

    return AwsApiGatewayResponse(
      statusCode: 200,
      body: jsonEncode({
        "status": "ok",
        "content": "Lobbies aggiunte correttamente",
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
