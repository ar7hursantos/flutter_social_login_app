import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/stores/user_store.dart';
import 'push_notification_strategies/push_notification_factory.dart';

class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static final NotificationHandler _singleton = NotificationHandler._internal();
  UserStore userStore = Modular.get<UserStore>();
  SharedPreferences prefs = Modular.get<SharedPreferences>();

  factory NotificationHandler() {
    return _singleton;
  }
  NotificationHandler._internal();

  Future<void> initializeFcmNotification() async {
    _firebaseMessaging.configure(
      onMessage: (message) {
        _processMessage('onMessage', message);
        return;
      },
      onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
      onResume: (message) {
        _processMessage('onResume', message);
        return;
      },
      onLaunch: (message) {
        _processMessage('onLaunch', message);
        return;
      },
    );

    if (Platform.isIOS) {
      _firebaseMessaging.onIosSettingsRegistered.listen((data) {
        // save the token  OR subscribe to a topic here
        print("Settings registered: $data");
      });
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true));
    }

    var firebaseMessagingToken = await _firebaseMessaging.getToken();
    print(firebaseMessagingToken);
    await prefs.setString('firebaseMessagingToken', firebaseMessagingToken);
  }

  // TOP-LEVEL or STATIC function to handle background messages
  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    //Get.snackbar('myBackgroundMessageHandler', message.toString());
    return Future<void>.value();
  }

  Future<void> _processMessage(
      String type, Map<String, dynamic> message) async {
    String payload;
    if (Platform.isIOS) {
      payload = message['payload'];
    } else {
      payload = message['data']['payload'];
    }

    onSelectNotification(payload);
  }

  void onSelectNotification(String payload) {
    if (payload != null) {
      try {
        if (userStore != null && userStore.isLogged()) {
          var factory = PushNotificationFactory.create(json.decode(payload));
          factory.execute();
        }
      } on Exception catch (e) {
        print(e.toString());
      }
    }
  }
}
