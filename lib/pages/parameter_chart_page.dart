import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'package:flutter_application_1/widgets/parameter_chart.dart';
import 'package:flutter_application_1/services/appstate.dart';
import 'package:flutter_application_1/widgets/app_drawer.dart';

class ParameterChartPage extends StatefulWidget {
  final AppState appState;
  const ParameterChartPage({
  Key? key,
  required this.appState,
  }) : super(key: key);

  @override
  State<ParameterChartPage> createState() => _ParameterChartPageState();
}

class _ParameterChartPageState extends State<ParameterChartPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  double temperature = 0.0;
  double humidity = 0.0;
  double co2 = 0.0;
  double light = 0.0;
  List<dynamic> temperatures = [];
  List<dynamic> humidities = [];
  List<dynamic> carbons = [];
  List<dynamic> lights = [];
  @override
  void initState() {
    db
        .collection('parameters')
        .orderBy('created_at')
        .limit(30)
        .snapshots()
        .listen(
      (event) {
        FlutterLogs.logInfo(
            'Homepage', 'Firebase', 'Got ${event.docs.first.data()}');
        setState(() {
          temperature = event.docs.last.data()['temperature'].toDouble();
          humidity = event.docs.last.data()['humidity'].toDouble();
          co2 = event.docs.last.data()['co2'].toDouble();
          light = event.docs.last.data()['light'].toDouble();
        });

        temperatures = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            temperatures.add(element.data()['temperature'].toDouble());
          });
        } else {
          for (var element in event.docs) {
            temperatures.add(element.data()['temperature'].toDouble());
          }
        }

        humidities = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            humidities.add(element.data()['humidity'].toDouble());
          });
        } else {
          for (var element in event.docs) {
            humidities.add(element.data()['humidity'].toDouble());
          }
        }

        carbons = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            carbons.add(element.data()['co2'].toDouble());
          });
        } else {
          for (var element in event.docs) {
            carbons.add(element.data()['co2'].toDouble());
          }
        }

        lights = [];
        if (event.docs.length > 30) {
          event.docs.getRange(0, 30).forEach((element) {
            lights.add(element.data()['light'].toDouble());
          });
        } else {
          for (var element in event.docs) {
            lights.add(element.data()['light'].toDouble());
          }
        }
      },
      onError: (error) =>
          FlutterLogs.logInfo('Homepage', 'Firebase', 'Error: $error'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawer(appState: widget.appState),
      appBar: AppBar(
        backgroundColor: const Color(0xff987554),
        toolbarHeight: MediaQuery.of(context).size.height / 13,
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              "Parameter's",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
                fontFamily: 'Black Han Sans',
              ),
            ),
            Text(
              'Graph',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.black54,
                fontFamily: 'Black Han Sans',
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            splashColor: Colors.white10,
            child: Ink.image(
              fit: BoxFit.cover,
              width: 16,
              height: 16,
              image: const AssetImage('images/ey.png'),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ((MediaQuery.of(context).size.width * 0.8)),
                height: 42,
                decoration: ShapeDecoration(
                  color: const Color((0xff987554)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "PARAMETER'S HISTORY ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 1.10,
                      letterSpacing: 0.46,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ParameterChart(
                title: 'TEMPERATURE',
                icon: Icons.thermostat,
                parameterList: temperatures,
                interval: 15,
              ),
              const SizedBox(height: 30),
              ParameterChart(
                title: 'HUMIDITY',
                icon: Icons.water_drop_sharp,
                parameterList: humidities,
                interval: 15,
              ),
              const SizedBox(height: 30),
              ParameterChart(
                title: 'CO2 LEVEL',
                icon: Icons.co2,
                parameterList: carbons,
                interval: 15,
              ),
              const SizedBox(height: 30),
              ParameterChart(
                title: 'LIGHT INTENSITY',
                icon: Icons.lightbulb_sharp,
                parameterList: lights,
                interval: 1000,
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
