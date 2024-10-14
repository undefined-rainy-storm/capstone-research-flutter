import 'package:http/http.dart' as http;
import 'package:flutter_background/flutter_background.dart';

void startBackgroundTask() async {
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "Background Service",
    notificationText: "Fetching data...",
    notificationImportance: AndroidNotificationImportance.normal,
  );

  await FlutterBackground.initialize(androidConfig: androidConfig);
  bool hasPermissions = await FlutterBackground.hasPermissions;
  if (hasPermissions) {
    bool success = await FlutterBackground.enableBackgroundExecution();

    if (success) {
      // Run your background task, e.g., send an HTTP request
      final response = await http.get(Uri.parse('https://example.com/data'));
      if (response.statusCode == 200) {
        print("Data fetched in background: ${response.body}");
      } else {
        print("Failed to fetch data in background");
      }
    }
  }
}
