import 'dart:convert';

import 'package:s3_storage/s3_storage.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';

Future<AwsApiGatewayResponse> getPresigned(
  Context context,
  AwsApiGatewayEvent event,
) async {
  final corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type,Content-Encoding',
    'Access-Control-Allow-Methods': 'OPTIONS,PUT,POST,GET',
  };
  try {
    final s3 = S3Storage(
        endPoint: "s3.amazonaws.com",
        accessKey: context.accessKey!,
        secretKey: context.secretAccessKey!,
        sessionToken: context.sessionToken!,
        region: context.region!);
    final url = await s3.presignedPutObject("chat-avatar-bucket", "/image");

    return AwsApiGatewayResponse(
        statusCode: 200,
        body: jsonEncode({
          "status": "ok",
          "content": url,
        }),
        headers: corsHeaders);
  } catch (e) {
    return AwsApiGatewayResponse(
        statusCode: 500,
        body: jsonEncode({
          "status": "ko",
          "content": {
            "error": e.toString(),
            "stacktrace": e.toString(),
          },
        }),
        headers: corsHeaders);
  }
}
