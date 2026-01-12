import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _notifications.initialize(settings);
  }

  static Future<void> showGoalExceeded() async {
    const androidDetails = AndroidNotificationDetails(
      'goal_channel',
      'Calorie goal',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notifications.show(
      0,
      'Goal exceeded 🚨',
      'You have exceeded your daily calorie goal',
      notificationDetails,
    );
  }
}
