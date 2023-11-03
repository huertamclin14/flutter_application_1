import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

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
        minHeight: 1550,
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
                          child: Column(
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
                    color: const Color(0xFFEDF7ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.device_thermostat,
                            size: 35,
                            color: Color((0xFF386150)),
                          ),
                          Text(
                            "TEMPERATURE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
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
                              color: Colors.black,
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
                              color: Colors.black,
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
                          padding: EdgeInsets.all(10),
                          child: Column(
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
                  color: const Color(0xFFEDF7ED),
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
                          color: Color((0xFF386150)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "HUMIDITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
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
                            color: Colors.black,
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
                            color: Colors.black,
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
                          padding: EdgeInsets.all(10),
                          child: Column(
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
                  color: const Color(0xFFEDF7ED),
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
                          color: Color((0xFF386150)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "CO2 LEVEL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
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
                            color: Colors.black,
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
                            color: Colors.black,
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
                          padding: EdgeInsets.all(10),
                          child: Column(
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
                  color: const Color(0xFFEDF7ED),
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
                          color: Color((0xFF386150)),
                        ),
                        Text(
                          "LIGHT INTENSITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
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
                            color: Colors.black,
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
                            color: Colors.black,
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
          const SizedBox(
            height: 40,
          ),
          Container(
            width: ((MediaQuery.of(context).size.width * 0.8)),
            height: 42,
            decoration: ShapeDecoration(
              color: const Color((0xFF386150)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PARAMETER'S HISTORY ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.10,
                    letterSpacing: 0.46,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: ((MediaQuery.of(context).size.width - 40) * 0.9),
            height: 250,
            decoration: ShapeDecoration(
              color: const Color(0xFFEDF7ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color((0xFF386150)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      Icon(
                        Icons.device_thermostat,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'TEMPERATURE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.10,
                          letterSpacing: 0.46,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            spots: temperatures
                                .mapIndexed((index, element) => FlSpot(
                                    index.toDouble(), element.toDouble()))
                                .toList(),
                            isCurved: false,
                            dotData: const FlDotData(show: false),
                            barWidth: 3,
                            color: Color(0xffff5252)),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles:
                            AxisTitles(sideTitles: _leftsidetemperature),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: ((MediaQuery.of(context).size.width - 40) * 0.9),
            height: 250,
            decoration: ShapeDecoration(
              color: const Color(0xFFEDF7ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color((0xFF386150)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.water_drop_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'HUMIDITY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.10,
                          letterSpacing: 0.46,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            spots: humidities
                                .mapIndexed((index, element) => FlSpot(
                                    index.toDouble(), element.toDouble()))
                                .toList(),
                            isCurved: false,
                            dotData: const FlDotData(show: false),
                            barWidth: 3,
                            color: Color(0XFF77aaff)),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidehumidity),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: ((MediaQuery.of(context).size.width - 40) * 0.9),
            height: 250,
            decoration: ShapeDecoration(
              color: const Color(0xFFEDF7ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color((0xFF386150)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.co2_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'CO2 LEVEL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.10,
                          letterSpacing: 0.46,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            spots: carbons
                                .mapIndexed((index, element) => FlSpot(
                                    index.toDouble(), element.toDouble()))
                                .toList(),
                            isCurved: false,
                            dotData: const FlDotData(show: false),
                            barWidth: 3,
                            color: Color(0xff8ae429)),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidec02),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: ((MediaQuery.of(context).size.width - 40) * 0.9),
            height: 250,
            decoration: ShapeDecoration(
              color: const Color(0xFFEDF7ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color((0xFF386150)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'LIGHT INTENSITY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.10,
                          letterSpacing: 0.46,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            spots: lights
                                .mapIndexed((index, element) => FlSpot(
                                    index.toDouble(), element.toDouble()))
                                .toList(),
                            isCurved: false,
                            dotData: const FlDotData(show: false),
                            barWidth: 3,
                            color: Color(0xfff9e909)),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidelight),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
              
            ),
          )
        ],
      ),
    ));
  }

  SideTitles get _bottomTitles => SideTitles(
      interval: 3,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });
  SideTitles get _leftsidetemperature => SideTitles(
      interval: 15,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });
  SideTitles get _leftsidehumidity => SideTitles(
      interval: 15,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });
  SideTitles get _leftsidec02 => SideTitles(
      interval: 1000,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        int values = (value / 1000).round();
        return Text('$values k');
      });
  SideTitles get _leftsidelight => SideTitles(
      interval: 15,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });
}
