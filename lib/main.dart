// ignore_for_file: prefer_function_declarations_over_variables
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:dart_template/handlers/api/iot/iot_connection.dart';
import 'package:dart_template/handlers/api/user/GetUser.dart';
import 'package:dart_template/handlers/api/user/PutUser.dart';

void main() async {
  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("main.putUser", putUser)
    ..registerHandler<AwsApiGatewayEvent>("main.getUser", getUser)
    ..registerHandler<AwsApiGatewayEvent>("main.iotConnection", iotConnection)
    ..invoke();
}
