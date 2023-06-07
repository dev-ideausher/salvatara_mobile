import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';

class SendNotification {
  static Future<bool> sendFcmMessage(String title, String message) async {
    try {
      var url = 'https://fcm.googleapis.com/fcm/send';
      var header = {
        "Content-Type": "application/json",
        "Authorization":
        "key=AAAA9vp7aio:APA91bFfZOl80Ryl7kznGsHmW7y2PRSZRoMWI81tkUW9I4n0P1-XXe_FhqkWKhJH_qiH9WuwUSCI1idsPsAs5D2qZuSh7Ls_zK3QobNVixtqrAV4GQNxPPUlZbIISRANlvIXnUM7Of2b",
      };
      /*  var request = {
        "notification": {
          "title": title,
          "text": message,
          "sound": "default",
          "color": "#990000",
        },
        "priority": "high",
        "to": "/topics/all",
      };*/
      var request = {
        'notification': {'title': title, 'body': message},
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'type': 'COMMENT'
        },
        "priority": "high",
        'to':
        'fHqcGfdXRUKQNHph5rBLcD:APA91bFMlW9p5YJi5vk1F30SaAVH2bqr34oHU44jIZcDeQhdaFgZhL1t6MstcCN5AzyOgWaOd_LetDbqwHXAtMK5ogo5AH_dL5cdv9v3MZRFcE0aDhFI5HbcNobk_B2onapTDKundZhG'
      };

      var client = new Client();
      var response = await client.post(Uri.parse(url),
          headers: header, body: json.encode(request));
      return true;
    } catch (e, s) {
      print(e);
      return false;
    }
  }


  static Future<bool> sendTopicNotification(
      {required String title,required String message,required String topic }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var url = 'https://fcm.googleapis.com/fcm/send';
      var header = {
        "Content-Type": "application/json",
        "Authorization": "key=AAAAe9hmELA:APA91bF5YrNWC-0_sOg2lNCfao5YDRyD2yUKBQaZFyVeAzCeWHk8bw1xBTALvNV3OzfsvWVOr2spGNLCZC4AB3SkenbQOCSuqX7m1AgCC4RnsTutQDPTVEmZ_l9eeAKg1hm-Z1twilfq",
      };
      /*  var request = {
        "notification": {
          "title": title,
          "text": message,
          "sound": "default",
          "color": "#990000",
        },
        "priority": "high",
        "to": "/topics/all",
      };*/
      var request = {
        'notification': {'title': title, 'body': message,
          "sound": "default",
          "color": "#990000",},
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'type': 'Group',
          'uid': "${auth.currentUser?.uid}",
          'gId': topic,
        },
        "priority": "high",
        'to': '/topics/'+topic
      };

      var client = new Client();
      var response = await client.post(Uri.parse(url), headers: header, body: json.encode(request));
      print(response.statusCode);
      return true;
    } catch (e, s) {
      print(e);
      return false;
    }
  }



}