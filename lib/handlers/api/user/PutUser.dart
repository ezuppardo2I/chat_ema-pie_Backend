import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/DTO/UserPutRequest.dart';
import 'package:dart_template/marshall.dart';
import 'dart:convert';
import 'package:dart_template/handlers/models/User.dart';

Future<AwsApiGatewayResponse> putUser(
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

    final request = UserPutRequest.fromJson(jsonDecode(event.body!));

    final existingUser = await db.query(
      tableName: "chat-users",
      indexName: "email-index",
      keyConditionExpression: "email = :email",
      expressionAttributeValues: {
        ":email": AttributeValue(s: request.email),
      },
    );

    if (existingUser.items != null && existingUser.items!.isNotEmpty) {
      return AwsApiGatewayResponse(
        statusCode: 409,
        body: jsonEncode({
          "status": "ko",
          "content": "Email già esistente. Usa un'altra email.",
        }),
        headers: corsHeaders,
      );
    }

    final newUser = User(
        userID: request.userID,
        email: request.email,
        avatarImage: request.avatarImage ??
            "https://chat-avatar-bucket.s3.eu-west-2.amazonaws.com/image/placeholder.jpg",
        lobbiesIDs: []);

    await db.putItem(
      item: marshall(newUser.toJson()),
      tableName: "chat-users",
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
