import 'dart:convert';

import 'package:aws_client/iot_2015_05_28.dart';
import 'package:aws_lambda_dart_runtime/events/apigateway_event.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/IotConnectionRequest.dart';

Future<AwsApiGatewayResponse> iotConnection(
  Context context,
  AwsApiGatewayEvent event,
) async {
  try {
    final request = IotConnectionRequest.fromJson(jsonDecode(event.body!));
    if (request.cognitoIdentityID == null) {
      throw Exception("cognitoIdentityID è null");
    }

    final iot = IoT(region: "eu-west-2");

    await iot.attachPolicy(
      policyName: "EmaIotPolicy",
      target: request.cognitoIdentityID!,
    );

    return AwsApiGatewayResponse(
      statusCode: 200,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
      body: jsonEncode({"status": "ok", "content": "Connessione aperta"}),
    );
  } catch (error, stacktrace) {
    print("Error: $error");
    print("stacktrace $stacktrace");
    return AwsApiGatewayResponse(
      statusCode: 500,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
      body: jsonEncode({
        "status": "ko",
        "content": "Errore durante la connessione",
      }),
    );
  }
}
