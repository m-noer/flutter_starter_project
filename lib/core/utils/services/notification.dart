import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_starter_project/core/constants/key_constants.dart';
import 'package:flutter_starter_project/core/constants/notification_constants.dart';
import 'package:flutter_starter_project/core/di/injection.dart';
import 'package:flutter_starter_project/core/utils/services/shared_prefs.dart';
import 'package:rxdart/subjects.dart';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? payload;
}

/// fcm notifications service
class NotificationService {
  final deviceInfo = DeviceInfoPlugin();
  final _prefs = sl<SharedPrefs>();

  /// * make increment when notification is exist
  /// * in case if without message id, current notification will replace
  /// * by new notification

  int messageId = 0;

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final BehaviorSubject<ReceivedNotification>
      didReceiveLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  /// * setup notifiation for android setting,
  /// * will show large avatar make sure add largeicon constructor
  ///
  static const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    MyNotificationConstant.channelId,
    MyNotificationConstant.channelName,
    channelDescription: MyNotificationConstant.channelDescription,
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    enableLights: true,
    groupKey: MyNotificationConstant.groupKey,
  );

  /// * setup ios notification
  ///
  static const IOSNotificationDetails iosNotificationDetails =
      IOSNotificationDetails(
          badgeNumber: 1,
          presentSound: true,
          presentAlert: true,
          presentBadge: true);

  final platformChannelSpecifics = const NotificationDetails(
    android: androidNotificationDetails,
    iOS: iosNotificationDetails,
  );

  Future initialize() async {
    final fcm = FirebaseMessaging.instance;

    /// * Initialization fcm token from generate by device
    ///
    await FirebaseMessaging.instance.getToken().then((value) {
      log('FCM_TOKEN :$value', name: 'FCM');
    });

    /// * setup notification permission on iOS, in case android
    /// * not need permission
    ///
    final settings = await fcm.requestPermission(
      announcement: true,
      criticalAlert: true,
      provisional: true,
    );

    /// * get response granted or not granted by user on notification permission
    ///
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission', name: 'NOTIF_PERMISSION');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission', name: 'NOTIF_PERMISSION');
    } else {
      log('User declined or has not accepted permission',
          name: 'NOTIF_PERMISSION');
    }

    /// * setting android icon notification by assets name id drawable
    ///
    const settingsAndroid = AndroidInitializationSettings('launch_background');

    /// * setup iOS setting in initialization notification badge and other
    ///
    final settingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification:
          (int? id, String? title, String? body, String? payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      },
    );

    /// * finally initialization notification both android or iOS
    ///
    final initializationSettings =
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS);

    /// * this function is callable to initialization notification on another
    /// class
    /// in case call this on initial class user already login [home page]
    /// and [navigation]
    ///
    await notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          log('notification payload: $payload');
        }
        selectNotificationSubject.add(payload!);
      },
    );

    /// * set foreground component show on notification
    ///
    await fcm.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    /// * initialization firebase messaging
    ///
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        showNotifications(
          message,
          platformChannelSpecifics,
        );
      }
    });

    /// * To handle messages whilst the app is in the background or terminated,
    /// see [onBackgroundMessage].
    ///
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("ON MESSAGE ---> ${message.data['chat_topic_id']}");

      final notification = message.notification;

      final currentChatTopicId = _prefs.getString(KeyConstants.keyChatTopicId);

      if (message.data['chat_topic_id'] != currentChatTopicId &&
          notification != null) {
        showNotifications(message, platformChannelSpecifics);
      }
    });

    /// * If your app is opened via a notification whilst the app is terminated,
    /// see [getInitialMessage].
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      showNotifications(
        message,
        platformChannelSpecifics,
      );
    });
  }

  /// * get preference device type if show notification
  ///
  void showNotifications(RemoteMessage message, NotificationDetails channel) {
    Platform.isAndroid
        ? showNotificationAndroid(message, channel)
        : showNotificationIos(message, channel);
  }

  /// * show notification on Android device
  ///
  Future<void> showNotificationAndroid(RemoteMessage message,
      NotificationDetails platformChannelSpecifics) async {
    messageId += 1;
    await notificationsPlugin.show(
      messageId,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
    );
  }

  /// * show notification on iOS device
  ///
  Future<void> showNotificationIos(RemoteMessage message,
      NotificationDetails platformChannelSpecifics) async {
    messageId += 1;
    await notificationsPlugin.show(
      messageId,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
    );
  }

  /// * cancel all notification  by id
  ///
  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  /// * cancel all notification [clear notification]
  ///
  Future<void> cancelAllNotification() async {
    await notificationsPlugin.cancelAll();
  }
}
