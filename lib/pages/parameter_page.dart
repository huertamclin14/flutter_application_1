import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'package:flutter_application_1/widgets/parameter_card.dart';
import 'package:flutter_application_1/widgets/parameter_chart.dart';

class ParameterPage extends StatefulWidget {
  const ParameterPage({super.key});

  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {
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
    return Container(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParameterCard(
                  title: 'TEMPERATURE',
                  value: temperature,
                  decimalPlace: 1,
                  icon: Icons.thermostat,
                  label: '°C',
                  popupTitle: 'Room Temperature',
                  popupSubtitle: 'Sensor: DHT 22',
                  popupContent:
                      'Description: The displayed temperature represents the real-time environmental parameter reading. The prototype is designed to maintain and control the temperature within a specific range of 30-35 degrees Celsius. This temperature range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                ),
                const SizedBox(width: 20),
                ParameterCard(
                  title: 'HUMIDITY',
                  value: humidity,
                  decimalPlace: 1,
                  icon: Icons.water_drop_sharp,
                  label: '%',
                  popupTitle: 'Room Humidity',
                  popupSubtitle: 'Sensor: DHT 22',
                  popupContent:
                      'Description: The displayed humidity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the humidity within a specific range of 80-90 %. This humidity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParameterCard(
                  title: 'C02 LEVEL',
                  value: co2,
                  decimalPlace: 0,
                  icon: Icons.co2,
                  label: 'PPM',
                  popupTitle: 'Room C02 Level',
                  popupSubtitle: 'Sensor: MQ-135 Gas Sensor',
                  popupContent:
                      'Description: The displayed c02 level represents the real-time environmental parameter reading. The prototype is designed to maintain and control the c02 level within a specific range of 1000-1500 PPM. This carbon dioxide range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                ),
                const SizedBox(width: 20),
                ParameterCard(
                  title: 'LIGHT INTENSITY',
                  value: light,
                  decimalPlace: 1,
                  icon: Icons.lightbulb_sharp,
                  label: 'LUX',
                  popupTitle: 'Room Light Intensity',
                  popupSubtitle: 'Sensor: BH1750 Light Sensor',
                  popupContent:
                      'Description: The displayed light intensity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the light intensity within a specific range of 500 LUX. This light intensity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
