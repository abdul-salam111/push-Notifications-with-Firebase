import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notifi/firebase_options.dart';
import 'package:push_notifi/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notifi/notifications_services.dart';

@pragma('vm:entry-point')
Future <void>firebasemessaging(RemoteMessage message)async{
  await Firebase.initializeApp();

}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage((message) => firebasemessaging(message));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
