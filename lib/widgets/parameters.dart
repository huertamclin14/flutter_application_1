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
    final humidities= widget.humidities;
    final carbons = widget.carbons;
    final lights= widget.lights;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.43),
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
                          Icons.device_thermostat,
                          size: 39,
                          color: Color((0xFFA8C96F)),
                        ),
                        Text(
                          "TEMPERATURE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
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
                            fontSize: 40,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.34,
                            letterSpacing: 0.46,
                          ),
                        ),
                        const Text(
                          '°C',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.43),
                height: 151,
                decoration: ShapeDecoration(
                  color: Color(0xFFEDF7ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop_sharp,
                          size: 39,
                          color: Color((0xFFA8C96F)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "HUMIDITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          humidity.toStringAsFixed(1),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.34,
                            letterSpacing: 0.46,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.43),
                height: 151,
                decoration: ShapeDecoration(
                  color: Color(0xFFEDF7ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.co2_sharp,
                          size: 39,
                          color: Color((0xFFA8C96F)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "CO2 LEVEL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          co2.toStringAsFixed(0),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.34,
                            letterSpacing: 0.46,
                          ),
                        ),
                        Text(
                          'PPM',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: ((MediaQuery.of(context).size.width - 40) * 0.43),
                height: 151,
                decoration: ShapeDecoration(
                  color: Color(0xFFEDF7ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lightbulb_sharp,
                          size: 39,
                          color: Color((0xFFA8C96F)),
                        ),
                        Text(
                          "LIGHT INTENSITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.5,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          light.toStringAsFixed(1),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 0.34,
                            letterSpacing: 0.46,
                          ),
                        ),
                        Text(
                          'LUX',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.46,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color ((0xFFA8C96F)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      Icon(
                          Icons.device_thermostat,
                          size: 30,
                          color: Colors.white,
                        ),
                      SizedBox(width: 2,),
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
                SizedBox(height: 20),
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
                            dotData: FlDotData(show: false),
                            barWidth: 3,
                            color: Colors.red.shade700),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidetemperature),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color ((0xFFA8C96F)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(
                          Icons.water_drop_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      SizedBox(width: 5,),
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
                SizedBox(height: 20),
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
                            dotData: FlDotData(show: false),
                            barWidth: 3,
                            color: Colors.blue.shade700),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidehumidity),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color ((0xFFA8C96F)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(
                          Icons.co2_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      SizedBox(width: 5,),
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
                SizedBox(height: 20),
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
                            dotData: FlDotData(show: false),
                            barWidth: 3,
                            color: Colors.grey),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidec02),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width - 40) * 0.55),
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color ((0xFFA8C96F)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Icon(
                          Icons.lightbulb_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      SizedBox(width: 5,),
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
                SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            spots:lights
                                .mapIndexed((index, element) => FlSpot(
                                    index.toDouble(), element.toDouble()))
                                .toList(),
                            isCurved: false,
                            dotData: FlDotData(show: false),
                            barWidth: 3,
                            color: Colors.amber),
                      ],
                      borderData: FlBorderData(
                          border: const Border(
                              bottom: BorderSide(), left: BorderSide())),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftsidelight),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
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
    );
  }

  SideTitles get _bottomTitles => SideTitles(
      interval: 2,
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
        int values = (value/1000).round();
        return Text('$values k');
      });
  SideTitles get _leftsidelight => SideTitles(
      interval: 15,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });
}
