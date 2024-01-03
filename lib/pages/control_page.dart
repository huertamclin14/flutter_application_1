import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'package:flutter_application_1/widgets/control_card.dart';
import 'package:flutter_application_1/widgets/parameter_chart.dart';

import 'package:flutter_application_1/services/appstate.dart';
import 'package:flutter_application_1/widgets/app_drawer.dart';

class ControlPage extends StatefulWidget {
  final AppState appState;
  final SwitchState switchState;
  const ControlPage({Key? key, required this.appState, required this.switchState}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
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
    super.initState();
    // Add any initialization logic here if needed
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
        title: Row(
          children: [
            Text(
              'CONTROL',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
                fontFamily: 'Black Han Sans',
              ),
            ),
            Text(
              'System',
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 1550),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ControlCard(
                        title: 'MACHINE',
                        value: temperature,
                        decimalPlace: 1,
                        icon: Icons.power_settings_new,
                        label:  widget.switchState.isSwitchOn ? 'ON' : 'OFF',
                        popupTitle: 'Room Temperature',
                        popupSubtitle: 'Sensor: DHT 22',
                        popupContent:
                            'Description: The displayed temperature represents the real-time environmental parameter reading. The prototype is designed to maintain and control the temperature within a specific range of 30-35 degrees Celsius. This temperature range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                        switchState: widget.switchState
                      ),
                      const SizedBox(width: 20),
                      ControlCard(
                        title: 'HEATER FAN',
                        value: humidity,
                        decimalPlace: 1,
                        icon: Icons.hvac,
                        label: widget.switchState.isSwitchOn ? 'ON' : 'OFF',
                        popupTitle: 'Room Humidity',
                        popupSubtitle: 'Sensor: DHT 22',
                        popupContent:
                            'Description: The displayed humidity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the humidity within a specific range of 80-90 %. This humidity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                        switchState: widget.switchState
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ControlCard(
                        title: 'HUMIDIFIER',
                        value: co2,
                        decimalPlace: 0,
                        icon: Icons.heat_pump,
                        label: widget.switchState.isSwitchOn ? 'ON' : 'OFF',
                        switchState: widget.switchState,
                        popupTitle: 'Room C02 Level',
                        popupSubtitle: 'Sensor: MQ-135 Gas Sensor',
                        popupContent:
                            'Description: The displayed c02 level represents the real-time environmental parameter reading. The prototype is designed to maintain and control the c02 level within a specific range of 1000-1500 PPM. This carbon dioxide range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                      ),
                      const SizedBox(width: 20),
                      ControlCard(
                        title: 'LIGHTING',
                        value: light,
                        decimalPlace: 1,
                        icon: Icons.lightbulb_circle,
                        label: widget.switchState.isSwitchOn ? 'ON' : 'OFF',
                        switchState: widget.switchState,
                        popupTitle: 'Room Light Intensity',
                        popupSubtitle: 'Sensor: BH1750 Light Sensor',
                        popupContent:
                            'Description: The displayed light intensity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the light intensity within a specific range of 500 LUX. This light intensity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }
}
