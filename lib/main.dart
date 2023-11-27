import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/services/notification_service.dart';
import 'package:flutter_application_1/services/appstate.dart';

import 'package:flutter_application_1/pages/home_page.dart';

late KabutechDatabase database;

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

  // Initialized Local Database
  database = KabutechDatabase('kabutech_test_db_1');
  await database.initializeDatabase();
  Map<String, dynamic> settings = await database.loadSettings();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase Messaging
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    showNotification(message.notification?.title ?? 'No title',
        message.notification?.body ?? 'No body');
  });

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  final fcmToken = await FirebaseMessaging.instance.getToken();
  final fcm = <String, String>{"key": fcmToken ?? ''};
  db.collection('users').doc(fcmToken).set(fcm);

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(
        database: database,
        settings: settings,
      ),
    ),
  );
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  showNotification(message.notification?.title ?? 'No title',
      message.notification?.body ?? 'No body');
}

class MyApp extends StatefulWidget {
  final KabutechDatabase database;
  final Map<String, dynamic> settings;
  const MyApp({
    super.key,
    required this.database,
    required this.settings,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool setupDone = false;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    if (!setupDone) {
      appState.initializeDatabase(widget.database);
      appState.initializeSettings(widget.settings);
      setupDone = true;
    }
    return MaterialApp(
      title: 'Kabutech',
      debugShowCheckedModeBanner: false,
      home: HomePage(
        appState: appState,
      ),
    );
  }
}
