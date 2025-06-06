import 'package:aws_client/dynamo_db_2012_08_10.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import 'package:dart_template/handlers/models/PostConfirmationTriggerEvent.dart';
import 'package:dart_template/handlers/models/User.dart';
import 'package:dart_template/marshall.dart';

Future<Map<String, dynamic>> putUser(
    Context context, PostConfirmationTriggerEvent event) async {
  try {
    final userAttributes = event.request['userAttributes'];

    print(userAttributes);

    final newUser = User(
      userID: userAttributes['sub'],
      email: userAttributes['email'],
      username: userAttributes['custom:username'],
      avatarImage:
          "https://chat-avatar-bucket.s3.eu-west-2.amazonaws.com/image/placeholder.jpg",
      lobbiesIDs: [],
    );

    final db = DynamoDB(region: context.region!);
    await db.putItem(
      item: marshall(newUser.toJson()),
      tableName: 'chat-users',
    );

    return event.toJson();
  } catch (e, st) {
    print('Errore: $e');
    print('Stacktrace: $st');

    return event.toJson();
  }
}
