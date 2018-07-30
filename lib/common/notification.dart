//import 'dart:async';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//class Notification {
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//  Notification() {}
//
//  static Future onSelectNotification(String payload) async {
//    if (payload != null) {
//      debugPrint('notification payload: ' + payload);
//    }
//
////    await Navigator.push(
////      context,
////      new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
////    );
//  }
//
//  Future _cancelAllNotifications() async {
//    await flutterLocalNotificationsPlugin.cancelAll();
//  }
//
//  static Future showNotification() async {
//    var initializationSettingsAndroid =
//        new AndroidInitializationSettings('app_icon');
//    var initializationSettingsIOS = new IOSInitializationSettings();
//    var initializationSettings = new InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        selectNotification: onSelectNotification);
//    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//        'your channel id', 'your channel name', 'your channel description',
//        importance: Importance.Max, priority: Priority.High);
//    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//    var platformChannelSpecifics = new NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
//  }
//}
