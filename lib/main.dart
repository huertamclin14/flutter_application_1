

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/topcard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'pages/parameters.dart';
import 'pages/history.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/services/notification_service.dart';
import 'pages/About.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:flutter_application_1/services/appstate.dart';
import 'package:flutter_application_1/services/notification_service.dart';
import 'package:flutter_logs/flutter_logs.dart';

late var fcmKey;
late KabutechDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = KabutechDatabase('kabutech_test_db_2');

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

  await database.initializeDatabase();
  Map<String, dynamic> settings = await database.loadSettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print(message.notification?.body ?? 'No new notification');
    showNotification(message.notification?.title ?? 'No title',
        message.notification?.body ?? 'No body');
    // showNotification(message.notification?.body ?? 'No new notification');
  });
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  fcmKey = await FirebaseMessaging.instance.getToken();

  runApp(const MyApp());
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  showNotification(message.notification?.title ?? 'No title',
      message.notification?.body ?? 'No body');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kabutech(),
    );
  }
}

class Kabutech extends StatefulWidget {
  const Kabutech({Key? key}) : super(key: key);

  @override
  State<Kabutech> createState() => _KabutechState();
}

class _KabutechState extends State<Kabutech> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  int index = 0;
  double temperature = 0.0;
  double humidity = 0.0;
  double co2 = 0.0;
  double light = 0.0;
  List<dynamic> harvests = [];
  List<dynamic> temperatures = [];
  List<dynamic> humidities = [];
  List<dynamic> carbons = [];
  List<dynamic> lights = [];

  @override
  void initState() {
    print(fcmKey);
    final fcm = <String, String>{"key": fcmKey};

    db.collection('users').doc(fcmKey).set(fcm);
    final docRef = db.collection('parameters').orderBy('created_at').snapshots().listen(
      (event) {
        setState(() {
          temperature = event.docs.last.data()['temperature'].toDouble();
          humidity = event.docs.last.data()['humidity'].toDouble();
          co2 = event.docs.last.data()['co2'].toDouble();
          light = event.docs.last.data()['light'].toDouble();
        });
        print('The temperature is: $temperature');
        print('The humidity is: $humidity');
        print('The co2 is: $co2');
        print('The light is: $light');

        temperatures = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            temperatures.add(element.data()['temperature'].toDouble());
          });
        } else {
          event.docs.forEach((element) {
            temperatures.add(element.data()['temperature'].toDouble());
          });
        }

        print(temperatures);

        humidities = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            humidities.add(element.data()['humidity'].toDouble());
          });
        } else {
          event.docs.forEach((element) {
            humidities.add(element.data()['humidity'].toDouble());
          });
        }

        print(humidities);

        carbons = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            carbons.add(element.data()['co2'].toDouble());
          });
        } else {
          event.docs.forEach((element) {
            carbons.add(element.data()['co2'].toDouble());
          });
        }

        print(carbons);

        lights = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            lights.add(element.data()['light'].toDouble());
          });
        } else {
          event.docs.forEach((element) {
            lights.add(element.data()['light'].toDouble());
          });
        }

        print(lights);
      },
      onError: (error) => print("Listen failed: $error"),
    );
    final harvestRef = db.collection('harvests').orderBy('created_at').snapshots().listen((event) {
      setState(() {
        harvests = [];
        event.docs.reversed.forEach((element) {
          harvests.add(element.data());
        });
      });

      print(harvests);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: index == 0 ? const Color(0xFF987554) : const Color(0xff6F4E37),
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('images/ey.png'),
                fit: BoxFit.contain,
                width: 60,
                height: 60),
            SizedBox(width: 10),
            Text(
              'MUSHROOM',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white70,
                  fontFamily: 'Black Han Sans'),
            ),
            Text(
              'Monitoring',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black54,
                  fontFamily: 'Black Han Sans'),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.white70,
              size: 25,
            ),
            onPressed: () {
               Get.to(() =>AboutAppScreen(), transition: Transition.circularReveal,
               duration: Duration(seconds: 1));
            },
          ),
          const Padding(padding: EdgeInsets.all(8))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: [
              TopCard(value: 40.5, index: index),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: (((MediaQuery.of(context).size.width - 10) - 20) * 0.58),
                height: 40,
                padding: const EdgeInsets.all(5),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF6F6F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: index == 0
                              ? const Color(0xff987554)
                              : const Color(0xFFf6f6f6),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ))),
                      child: Text(
                        'PARAMETERS',
                        style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black,
                          fontSize: 11,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: index == 0
                              ? const Color(0xFFf6f6f6)
                              : const Color(0xff987554),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)))),
                      child: Text(
                        ' HARVEST  ',
                        style: TextStyle(
                          color: index == 0 ? Colors.black : Colors.white,
                          fontSize: 11,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              index == 0
                  ? ParameterPage(
                      width: width,
                      height: height,
                      temperature: temperature,
                      humidity: humidity,
                      co2: co2,
                      light: light,
                      temperatures: temperatures,
                      humidities: humidities,
                      carbons: carbons,
                      lights: lights,
                    )
                  : HistoryPage(
                      width: width,
                      height: height,
                      harvests: harvests,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
