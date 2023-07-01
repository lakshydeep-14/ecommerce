import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:softbenz_infosys/configs/extensions.dart';

import '../main.dart';

class SendNotification {
  static void sendMessageNotification(String message) async {
    final token = await FirebaseMessaging.instance.getToken();
    Map<String, String> headerMap = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAjqH-8vs:APA91bFwj6f_B5xOdMYQ1Z5wK1aUkeYnaxfuxTcMSl0j6O9aP3V-dqoXh9iJ32ZM3Jrx-6Mgn942wXnjJBTljUGpTt1PnCSk58rOZ1VfL6Iui8XY-E96yLoS9FbNipesl4apecsU2Zhk'
    };

    Map notificationMap = {
      'title': 'Message Notification',
      'body': message,
      'sound': 'Beep',
    };

    Map dataMap = {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      'status': 'done',
      "ride_request_id": "",
      "user_id": "sender",
    };

    Map sendNotificationMap = {
      "to": token,
      "notification": notificationMap,
      "data": dataMap,
      "priority": "high",
    };

    await Dio().post('https://fcm.googleapis.com/fcm/send',
        data: jsonEncode(sendNotificationMap),
        options: Options(
          headers: headerMap,
        ));
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: 'app_icon',
              ),
            ));
      }
    });
    SnackBarShow().showSnack('Message Sent To Seller.',
        message: "Thank You For Contacting Us.");
  }
}
