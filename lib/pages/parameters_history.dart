import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

class ParametersHistory extends StatefulWidget {
  final double width;
  final double height;
  final List<dynamic> temperatures;
  final List<dynamic> humidities;
  final List<dynamic> carbons;
  final List<dynamic> lights;
  const ParametersHistory({
    super.key,
    required this.width,
    required this.height,
    required this.temperatures,
    required this.humidities,
    required this.carbons,
    required this.lights,
  });

  @override
  State<ParametersHistory> createState() => _ParametersHistoryState();
}

class _ParametersHistoryState extends State<ParametersHistory> {
  @override
  Widget build(BuildContext context) {
    final temperatures = widget.temperatures;
    final humidities = widget.humidities;
    final carbons = widget.carbons;
    final lights = widget.lights;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ((MediaQuery.of(context).size.width * 0.8)),
                height: 42,
                decoration: ShapeDecoration(
                  color: const Color((0xFF386150)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
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
                    
                    const SizedBox(
                      height: 20,
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
                            width: ((MediaQuery.of(context).size.width - 40) *
                                0.55),
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
                                          .mapIndexed((index, element) =>
                                              FlSpot(index.toDouble(),
                                                  element.toDouble()))
                                          .toList(),
                                      isCurved: false,
                                      dotData: const FlDotData(show: false),
                                      barWidth: 3,
                                      color: Color(0xffff5252)),
                                ],
                                borderData: FlBorderData(
                                    border: const Border(
                                        bottom: BorderSide(),
                                        left: BorderSide())),
                                gridData: const FlGridData(show: false),
                                titlesData: FlTitlesData(
                                  bottomTitles:
                                      AxisTitles(sideTitles: _bottomTitles),
                                  leftTitles: AxisTitles(
                                      sideTitles: _leftsidetemperature),
                                  topTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
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
                            width: ((MediaQuery.of(context).size.width - 40) *
                                0.55),
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
                                          .mapIndexed((index, element) =>
                                              FlSpot(index.toDouble(),
                                                  element.toDouble()))
                                          .toList(),
                                      isCurved: false,
                                      dotData: const FlDotData(show: false),
                                      barWidth: 3,
                                      color: Color(0XFF77aaff)),
                                ],
                                borderData: FlBorderData(
                                    border: const Border(
                                        bottom: BorderSide(),
                                        left: BorderSide())),
                                gridData: const FlGridData(show: false),
                                titlesData: FlTitlesData(
                                  bottomTitles:
                                      AxisTitles(sideTitles: _bottomTitles),
                                  leftTitles:
                                      AxisTitles(sideTitles: _leftsidehumidity),
                                  topTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
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
                            width: ((MediaQuery.of(context).size.width - 40) *
                                0.55),
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
                                          .mapIndexed((index, element) =>
                                              FlSpot(index.toDouble(),
                                                  element.toDouble()))
                                          .toList(),
                                      isCurved: false,
                                      dotData: const FlDotData(show: false),
                                      barWidth: 3,
                                      color: Color(0xff8ae429)),
                                ],
                                borderData: FlBorderData(
                                    border: const Border(
                                        bottom: BorderSide(),
                                        left: BorderSide())),
                                gridData: const FlGridData(show: false),
                                titlesData: FlTitlesData(
                                  bottomTitles:
                                      AxisTitles(sideTitles: _bottomTitles),
                                  leftTitles:
                                      AxisTitles(sideTitles: _leftsidec02),
                                  topTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
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
                            width: ((MediaQuery.of(context).size.width - 40) *
                                0.55),
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
                                          .mapIndexed((index, element) =>
                                              FlSpot(index.toDouble(),
                                                  element.toDouble()))
                                          .toList(),
                                      isCurved: false,
                                      dotData: const FlDotData(show: false),
                                      barWidth: 3,
                                      color: Color(0xfff9e909)),
                                ],
                                borderData: FlBorderData(
                                    border: const Border(
                                        bottom: BorderSide(),
                                        left: BorderSide())),
                                gridData: const FlGridData(show: false),
                                titlesData: FlTitlesData(
                                  bottomTitles:
                                      AxisTitles(sideTitles: _bottomTitles),
                                  leftTitles:
                                      AxisTitles(sideTitles: _leftsidelight),
                                  topTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
     
    );
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
