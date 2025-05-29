import 'dart:convert';

import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/marshall.dart';
import 'package:dart_template/handlers/models/User.dart';
import 'package:dart_template/unmarshal.dart';

Future<AwsApiGatewayResponse> getUser(
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

    final userID = event.pathParameters!['userID'];

    final results = await db.getItem(
        key: marshall({"userID": userID}), tableName: "chat-users");

    if (results.item == null) {
      return AwsApiGatewayResponse.fromJson({
        "statusCode": 404,
        "headers": corsHeaders,
        "body": jsonEncode({"message": "Utente non trovato"}),
      });
    }

    final user = User.fromJson(unmarshal(results.item!));

    return AwsApiGatewayResponse.fromJson({
      "statusCode": 200,
      "headers": corsHeaders,
      "body": jsonEncode(user.toJson()),
    });
  } catch (error, stacktrace) {
    print("Error: $error");
    print("stacktrace $stacktrace");

    return AwsApiGatewayResponse.fromJson({
      "statusCode": 500,
      "headers": corsHeaders,
      "body": jsonEncode({
        "error": error.toString(),
        "stacktrace": stacktrace.toString(),
      }),
    });
  }
}
