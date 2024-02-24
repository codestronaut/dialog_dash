import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  Client get appwriteClient {
    final client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('dialog-dash-ai')
        .setSelfSigned(status: true);

    return client;
  }
}
