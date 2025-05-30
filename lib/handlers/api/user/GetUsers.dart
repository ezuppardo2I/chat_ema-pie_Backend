import 'dart:convert';
import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/marshall.dart';
import 'package:dart_template/unmarshal.dart';

Future<AwsApiGatewayResponse> getUsers(
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

    final lastEvalueted = event.queryStringParameters?['lastEvalueted'];

    final results = await db.scan(
        tableName: "chat-users",
        limit: 50,
        exclusiveStartKey:
            lastEvalueted != null ? marshall({"userID": lastEvalueted}) : null);

    final users = results.items?.map((item) => unmarshal(item)).toList() ?? [];

    return AwsApiGatewayResponse(
      statusCode: 200,
      headers: corsHeaders,
      body: jsonEncode({"status": "ok", "data": users}),
    );
  } catch (error, stacktrace) {
    print("Error: $error");
    print("stacktrace $stacktrace");

    return AwsApiGatewayResponse(
      statusCode: 500,
      headers: corsHeaders,
      body: jsonEncode({
        "status": "ko",
        "error": error.toString(),
        "stacktrace": stacktrace.toString(),
      }),
    );
  }
}
