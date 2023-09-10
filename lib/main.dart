import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/topcard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'widgets/parameters.dart';
import 'widgets/history.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  FirebaseMessaging.onMessage.listen((RemoteMessage message){
    print(message.notification?.body ?? 'No new notification');
    // showNotification(message.notification?.body ?? 'No new notification');
  });
  // FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  runApp(const MyApp());
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  showNotification(message.notification?.body ?? 'No new notification');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
    showNotification('Test');
    final docRef = db.collection('parameters').snapshots().listen(
      (event) {
        setState(() {
          temperature = event.docs.last.data()['temperature'];
          humidity = event.docs.last.data()['humidity'];
          co2 = event.docs.last.data()['co2'];
          light = event.docs.last.data()['light'];
        });
        print('The temperature is: $temperature');
        print('The humidity is: $humidity');
        print('The co2 is: $co2');
        print('The light is: $light');

        temperatures = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            temperatures.add(element.data()['temperature']);
          });
        } else {
          event.docs.forEach((element) {
            temperatures.add(element.data()['temperature']);
          });
        }

        print(temperatures);

        humidities = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            humidities.add(element.data()['humidity']);
          });
        } else {
          event.docs.forEach((element) {
            humidities.add(element.data()['humidity']);
          });
        }

        print(humidities);

        carbons = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            carbons.add(element.data()['co2']);
          });
        } else {
          event.docs.forEach((element) {
            carbons.add(element.data()['co2']);
          });
        }

        print(carbons);

        lights = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            lights.add(element.data()['light']);
          });
        } else {
          event.docs.forEach((element) {
            lights.add(element.data()['light']);
          });
        }

        print(lights);
      },
      onError: (error) => print("Listen failed: $error"),
    );
    final harvestRef = db.collection('harvests').snapshots().listen((event) {
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
        backgroundColor: const Color(0xFFA8C96F),
        title: const Row(
          children: [
            Icon(Icons.account_circle, color: Colors.white, size: 50),
            SizedBox(width: 5),
            Text(
              'HELLO, USER!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto'),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 24,
          ),
          Padding(padding: EdgeInsets.all(8))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA8C96F), Color(0xFFD9D9D9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 2000,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopCard(value: 40.4),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: ((MediaQuery.of(context).size.width - 16   ) * 0.6),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEDF7ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: index == 0
                                ? Color(0xFFA8C96F)
                                : Color(0xFFEDF7ED),
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
                                ? const Color(0xFFEDF7ED)
                                : const Color(0xFFA8C96F),
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
      ),
    );
  }
}
