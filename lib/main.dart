import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'package:flutter_application_1/services/notification_service.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Logging
  await FlutterLogs.initLogs(
    logLevelsEnabled: [
      LogLevel.INFO,
      LogLevel.WARNING,
      LogLevel.ERROR,
      LogLevel.SEVERE
    ],
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    directoryStructure: DirectoryStructure.FOR_DATE,
    logTypesEnabled: ["device", "network", "errors"],
    logFileExtension: LogFileExtension.LOG,
    logsWriteDirectoryName: "logs",
    logsExportDirectoryName: "logs/exported",
    debugFileOperations: true,
    isDebuggable: true,
  );

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase Messaging
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print(message.notification?.body ?? 'No new notification');
    showNotification(message.notification?.title ?? 'No title',
        message.notification?.body ?? 'No body');
  });

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  final fcmToken = await FirebaseMessaging.instance.getToken();
  final fcm = <String, String>{"key": fcmToken ?? ''};
  db.collection('users').doc(fcmToken).set(fcm);
  runApp(const MyApp());
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  showNotification(message.notification?.title ?? 'No title',
      message.notification?.body ?? 'No body');
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onion Sense',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
