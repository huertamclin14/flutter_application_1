import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/widgets/control_card.dart';

import 'package:flutter_application_1/services/appstate.dart';
import 'package:flutter_application_1/widgets/app_drawer.dart';

class ControlPage extends StatefulWidget {
  final AppState appState;
  const ControlPage({Key? key, required this.appState}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool powerState = false;
  bool heaterState = false;
  bool lightState = false;
  bool humidifierState = false;
  @override
  void initState() {
    db.collection('states').doc('current').snapshots().listen((event) {
      setState(() {
        powerState = event.data()?['power'];
        heaterState = event.data()?['heater'];
        lightState = event.data()?['light'];
        humidifierState = event.data()?['humidifier'];
      });
    });
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ControlCard(
                    title: 'MACHINE',
                    icon: Icons.power_settings_new,
                    onLabel: 'ON',
                    offLabel: 'OFF',
                    onPressed: updatePower,
                    popupTitle: 'Machine',
                    popupSubtitle: 'Sensor: DHT 22',
                    popupContent:
                        'Description: The displayed temperature represents the real-time environmental parameter reading. The prototype is designed to maintain and control the temperature within a specific range of 30-35 degrees Celsius. This temperature range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                  ),
                  const SizedBox(width: 20),
                  ControlCard(
                    title: 'HEATER FAN',
                    icon: Icons.hvac,
                    onLabel: 'ON',
                    offLabel: 'OFF',
                    onPressed: updateHeater,
                    popupTitle: 'Heater Fan',
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
                    title: 'HUMIDIFIER',
                    icon: Icons.heat_pump,
                    onLabel: 'ON',
                    offLabel: 'OFF',
                    onPressed: updateHumidifier,
                    popupTitle: 'Humidifier',
                    popupSubtitle: 'Sensor: MQ-135 Gas Sensor',
                    popupContent:
                        'Description: The displayed c02 level represents the real-time environmental parameter reading. The prototype is designed to maintain and control the c02 level within a specific range of 1000-1500 PPM. This carbon dioxide range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                  ),
                  const SizedBox(width: 20),
                  ControlCard(
                    title: 'LIGHTING',
                    icon: Icons.lightbulb_circle,
                    onLabel: 'ON',
                    offLabel: 'OFF',
                    onPressed: updateLight,
                    popupTitle: 'Light',
                    popupSubtitle: 'Sensor: BH1750 Light Sensor',
                    popupContent:
                        'Description: The displayed light intensity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the light intensity within a specific range of 500 LUX. This light intensity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updatePower(bool value) {
    db.collection('states').doc('current').update({
      'power': value, 'updated_at' : DateTime.now()
    });
  }

  void updateHeater(bool value) {
    db.collection('states').doc('current').update({'heater': value, 'updated_at' : DateTime.now()});
  }

  void updateHumidifier(bool value) {
    db.collection('states').doc('current').update({'humidifier': value, 'updated_at' : DateTime.now()});
  }

  void updateLight(bool value) {
    db.collection('states').doc('current').update({'light': value, 'updated_at' : DateTime.now()});
  }
}
