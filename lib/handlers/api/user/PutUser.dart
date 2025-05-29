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
  try {
    final db = DynamoDB(region: context.region!);

    final request = UserPutRequest.fromJson(jsonDecode(event.body!));

    final existingUser = await db.query(
      tableName: "chat-users",
      indexName: "email-index",
      keyConditionExpression: "email = :email",
      expressionAttributeValues: {
        ":userID": AttributeValue(s: request.email),
      },
    );

    if (existingUser.items != null && existingUser.items!.isNotEmpty) {
      return AwsApiGatewayResponse.fromJson({
        "status": "ko",
        "content": "Utente già esistente con questa email",
      });
    }

    final newUser = User(
      userID: request.userID,
      username: request.username,
      email: request.email,
      avatarImage: request.avatarImage ??
          "https://chat-avatar-bucket.s3.eu-west-2.amazonaws.com/image/placeholder.jpg",
    );
    await db.putItem(
      item: marshall(newUser.toJson()),
      tableName: "chat-users",
    );

    return AwsApiGatewayResponse.fromJson({
      "status": "ok",
      "content": "Utente inserito correttamente",
    });
  } catch (error, stacktrace) {
    print("Error: $error");
    print("stacktrace $stacktrace");

    return AwsApiGatewayResponse.fromJson({
      "status": "ko",
      "content": {"error": error, "stacktrace": stacktrace},
    });
  }
}
