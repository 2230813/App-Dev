import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService{
  static final NotificationService _notificationService =
      NotificationService.internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService.internal();

  Future<void> initNotification() async{
    final AndroidInitializationSettings initializationSettingsAnroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAnroid);
    //the settings are initialized after they are set by the UI
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body) async{
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 2)),
        NotificationDetails(
          android: AndroidNotificationDetails(
            'main_channel', "Main Channel",
            channelDescription: 'private',
            importance: Importance.max
          ),
        ), //Android details
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}