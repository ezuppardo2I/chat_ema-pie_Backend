import 'package:aws_client/cognito_identity_provider_2016_04_18.dart';
import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_client/elasti_cache_2015_02_02.dart';
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

    final api = CognitoIdentityProvider(region: 'eu-west-2');

    final cognitoPool = 'eu-west-2_YBmvyH80J';

    if (request.email.isNotEmpty && request.username.isNotEmpty) {
      final result = await api.adminCreateUser(
        userPoolId: cognitoPool,
        username: request.email,
        temporaryPassword: r'Pass123$$',
        userAttributes: [AttributeType(name: 'email', value: request.email)],
      );

      final userID = result.user!.username;

      if (userID != null) {
        final newUser = User(
          userID: userID,
          username: request.username,
          email: request.email,
          avatarImage: request.avatarImage,
        );
        await db.putItem(
          item: marshall(newUser.toJson()),
          tableName: "users-ema",
        );
      }
    } else {
      throw Exception("Errore, l'email inserita non è valida");
    }

    // await api.adminSetUserPassword(
    //   password: 'newpassword',
    //   userPoolId: cognitoPool,
    //   username: request.email,
    // );

    api.close();

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
