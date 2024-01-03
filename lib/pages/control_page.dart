import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'package:flutter_application_1/widgets/control_card.dart';
import 'package:flutter_application_1/widgets/parameter_chart.dart';

import 'package:flutter_application_1/services/appstate.dart';

class ControlPage extends StatefulWidget {
  final AppState appState;
  const ControlPage({super.key, 
  required this.appState});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
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

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 1550),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ControlCard(
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
                ControlCard(
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
                ControlCard(
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
                ControlCard(
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
          ],),),
    );
  }
}
