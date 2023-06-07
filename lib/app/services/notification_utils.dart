import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();


}

class FirebaseMessagingUtils {
  static final FirebaseMessagingUtils _firebaseMessagingUtils =
  FirebaseMessagingUtils();

  late AndroidNotificationChannel channel;

  static FirebaseMessagingUtils get firebaseMessagingUtils =>
      _firebaseMessagingUtils;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> _onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    print("notification received");
  }

  initFirebaseMessaging() async {
    channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'High Importance Channel',
        //'This channel is used for important notifications.', // description
        importance: Importance.high,
        playSound: true);

    var initializationSettingsAndroid = const AndroidInitializationSettings('notification');
    // var initializationSettingsIOS = IOSInitializationSettings(
    //     onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
      linux: null,
      macOS: null,
    );

    _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//h

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print(notification?.title);
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        try {
          _flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
            ),
            //   payload: message.data['page'],
          );
        } catch (e) {
          print(e);
        }

        // try {
        //   _flutterLocalNotificationsPlugin.show(
        //       message.data.hashCode,
        //       message.notification!.title.toString(),
        //       message.notification!.body.toString(),
        //       NotificationDetails(
        //         iOS: IOSNotificationDetails(),
        //         android: AndroidNotificationDetails(
        //           channel.id,
        //           channel.name,
        //         ),
        //       ));
        // } catch (e) {
        //   print(e);
        // }
      }


    });
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // It is assumed that all messages contain a data field with the key 'type'
    Future<void> setupInteractedMessage() async {
      // Get any messages which caused the application to open from
      // a terminated state.
      RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
      await Future.delayed(const Duration(seconds: 1));

      // If the message also contains a data property with a "type" of "chat",
      // navigate to a chat screen
      if (initialMessage != null) {
        // _firebaseMessagingBackgroundHandler(initialMessage);

        if (initialMessage.data['page'] != null ||
            initialMessage.data['page'] == '') {
          try {
            Get.toNamed(initialMessage.data['page']);
          } catch (e) {
            print(e);
          }
        }
      }
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(
          (initialMessage) async {
        await Future.delayed(const Duration(seconds: 1));

        if (initialMessage.data['page'] != null ||
            initialMessage.data['page'] == '') {
          try {
            Get.toNamed(initialMessage.data['page']);
          } catch (e) {
            print(e);
          }
        }
      },
    );

    await setupInteractedMessage();
    _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: true,
    );

    _firebaseMessaging.getToken().then((String? token) {
      print("Settings token: $token");
      // saveFCMTokenSF(token);
    });
  }

  Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> _onSelectNotification(String? payload) async {


    if (payload != null || payload == '') {
      try {
        Get.toNamed(payload.toString());
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> subFcm(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubFcm(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}
