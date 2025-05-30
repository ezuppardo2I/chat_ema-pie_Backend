import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/DTO/UserPatchRequest.dart';
import 'package:dart_template/marshall.dart';
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

    final request = UserPatchRequest.fromJson(jsonDecode(event.body!));

    await db.updateItem(
      key: marshall({"userId": request.userID}),
      tableName: "chat-users",
      updateExpression: "SET lobbiesIDs = :lobbiesIDs",
      expressionAttributeNames: {
        "lobbiesIDs": "lobbiesIDs",
      },
      expressionAttributeValues: marshall({
        ":lobbiesIDs": request.lobbiesIDs,
      }),
    );

    return AwsApiGatewayResponse(
      statusCode: 200,
      body: jsonEncode({
        "status": "ok",
        "content": "Utente editato correttamente",
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
