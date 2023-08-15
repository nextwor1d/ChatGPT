import 'package:dart_openai/dart_openai.dart';
import 'package:hive_flutter/hive_flutter.dart';

class APIConfig {
  static void setAPIonInit() async {
    Box apiBox = Hive.box('apiBox');
    OpenAI.apiKey = await apiBox.get('apiToken') ?? 'Initial-API-Key';
  }

  static void updateAPIKey(String newAPIKey) async {
    OpenAI.apiKey = newAPIKey;
    Box apiBox = Hive.box('apiBox');
    await apiBox.put('apiToken', newAPIKey);
  }
}
