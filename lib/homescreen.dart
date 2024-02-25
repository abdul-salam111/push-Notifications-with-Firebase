import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:push_notifi/notifications_services.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    notificationServices.requestNotificationsPermission();
    notificationServices.foregroundMessage();
    notificationServices.firebaseInit(context);

    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value) => print(value));

    // notificationServices.getRefreshedToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var devicetokens = [
              "cT5F0pFwTASF-cBFYTToyI:APA91bEzAgyeI2mdRj0X4hmv9i1QtsT0aPoVvSmor7AICG9486ThqVPC7EHSstj2U03SCkQy1ZvdhCLqVyxm4YMwrZzcWR_12GiP8C2ZsX2-y09Kp0z5XCjvpBAQ8IKdDAhBQOM_aqxT",
              "cbfe02r-RYWg-SU9T4xxIP:APA91bF991xn00_ofBiMJ7DsURtaMp-vv1f1umDzDDj0Z1CJhjqpF3_LtCl6x80kbyoPOrpMCzOkkuuoWrmpIJuxZ0IW3RVzPtsPRsoIn0QQ4MdCTAfRS1Gts8kRNLHfg0u5FgAxhGQ5",
              "dP3tsbxU6UnxgwWXl8ma9Q:APA91bEDKKU3iEZueeUShzEXP8omWLIYcoZkGEtRcWeFyurL7m1aFLYwyBdQ8EZpQiJGDh4StzVyq6SfvG2C_t2WYKwzLLRGDRacDtFNI-wc9oqXtYOg7lfv50PpHp2pYrggrooLGKU4"
            ];
            notificationServices.getDeviceToken().then((value) async {
              for (var tokens in devicetokens) {
                var data = {
                  'to': tokens,
                  'notification': {
                    'title': 'Abdul Salam',
                    'body': 'hellohh lhfkf lkxfjsd lkfslfjk',
                    "sound": "jetsons_doorbell.mp3"
                  },
                  'android': {
                    'notification': {
                      'notification_count': 24,
                    },
                  },
                  'data': {'type': 'msj', 'id': 'hdkhflkdhfklshfklsll'}
                };
                await http.post(
                    Uri.parse('https://fcm.googleapis.com/fcm/send'),
                    body: jsonEncode(data),
                    headers: {
                      'content-type': "application/json; charset=UTF-8",
                      "Authorization":
                          "key=AAAAO4Y-Ts8:APA91bGSKWYS6sE_xwJqTO9pvJZOS5EpEuG-IzB6fe0AnjeeAVkGShA9oo9BBQqTzJR_vONi1FVkDhYIV0fCGjVWgS35ThfTrP4yhUaGMrSBBLRfYUhUXjg3cVtISj-EsuAIrZw92cdh"
                    });
              }
            });
          },
          child: const Text("send notifications"),
        ),
      ),
    );
  }
}
