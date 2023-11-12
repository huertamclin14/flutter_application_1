import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/parameters_history.dart';


class ParameterPage extends StatefulWidget {
  final double width;
  final double height;
  final double temperature;
  final double humidity;
  final double co2;
  final double light;
  final List<dynamic> temperatures;
  final List<dynamic> humidities;
  final List<dynamic> carbons;
  final List<dynamic> lights;
  const ParameterPage(
      {super.key,
      required this.width,
      required this.height,
      required this.temperature,
      required this.humidity,
      required this.co2,
      required this.light,
      required this.temperatures,
      required this.humidities,
      required this.carbons,
      required this.lights});

  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {
  @override
  Widget build(BuildContext context) {
    double temperature = widget.temperature;
    double humidity = widget.humidity;
    double co2 = widget.co2;
    double light = widget.light;
    final temperatures = widget.temperatures;
    final humidities = widget.humidities;
    final carbons = widget.carbons;
    final lights = widget.lights;

    return Container(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 500,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width:
                              ((MediaQuery.of(context).size.width - 40) * 45),
                          height: 270,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEDF7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Room Temperature',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sensor: DHT 22',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Description: The displayed temperature represents the real-time environmental parameter reading. The prototype is designed to maintain and control the temperature within a specific range of 30-35 degrees Celsius. This temperature range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.45),
                  height: 151,
                  decoration: ShapeDecoration(
                    color: const Color(0xff987554),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.device_thermostat,
                            size: 35,
                            color: Colors.white
                          ),
                          Text(
                            "TEMPERATURE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'digital-7',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            temperature.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontFamily: 'digital-7',
                              fontWeight: FontWeight.w500,
                              height: 0.34,
                              letterSpacing: 1,
                            ),
                          ),
                          const Text(
                            '°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'digital-7',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.46,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width:
                              ((MediaQuery.of(context).size.width - 40) * 45),
                          height: 270,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEDF7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Room Humidity',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sensor: DHT 22',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Description: The displayed humidity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the humidity within a specific range of 80-90 %. This humidity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      );
                    },
                  );
                },
              child: Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.45),
                height: 151,
                decoration: ShapeDecoration(
                  color: const Color(0xff987554),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop_sharp,
                          size: 39,
                          color: Colors.white
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "HUMIDITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          humidity.toStringAsFixed(1),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w500,
                            height: 0.34,
                            letterSpacing: 1,
                          ),
                        ),
                        const Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width:
                              ((MediaQuery.of(context).size.width - 40) * 45),
                          height: 270,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEDF7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Room C02 Level',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sensor: MQ-135 Gas Sensor',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Description: The displayed c02 level represents the real-time environmental parameter reading. The prototype is designed to maintain and control the c02 level within a specific range of 1000-1500 PPM. This carbon dioxide range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      );
                    },
                  );
                },
              child: Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.45),
                height: 151,
                decoration: ShapeDecoration(
                  color: const Color(0xff987554),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.co2_sharp,
                          size: 39,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "CO2 LEVEL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          co2.toStringAsFixed(0),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w500,
                            height: 0.34,
                            letterSpacing: 1,
                          ),
                        ),
                        const Text(
                          'PPM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width:
                              ((MediaQuery.of(context).size.width - 40) * 45),
                          height: 270,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEDF7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Room Light Intensity',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sensor: BH1750 Light Sensor',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Description: The displayed light intensity represents the real-time environmental parameter reading. The prototype is designed to maintain and control the light intensity within a specific range of 500 LUX. This light intensity range is crucial as it corresponds to the ideal conditions required for mushroom cultivation.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      );
                    },
                  );
                },
              child: Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.45),
                height: 151,
                decoration: ShapeDecoration(
                  color: const Color(0xff987554),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lightbulb_sharp,
                          size: 39,
                          color: Colors.white,
                        ),
                        Text(
                          "LIGHT INTENSITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          light.toStringAsFixed(1),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w500,
                            height: 0.34,
                            letterSpacing: 1,
                          ),
                        ),
                        const Text(
                          'LUX',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'digital-7',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParametersHistory(width: widget.width, height: widget.width, temperatures: temperatures, humidities: humidities, carbons: carbons, lights: lights),),
                      
                    );
                  },
                  icon: const Icon(Icons.show_chart),
                  label: const Text('See Parameter History'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff987554),
                  ),
              ),
        ],
      ),
    ));
  }
}
