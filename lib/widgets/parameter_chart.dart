import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';

class ParameterChart extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<dynamic> parameterList;
  final double interval;
  const ParameterChart({
    super.key,
    required this.title,
    required this.icon,
    required this.parameterList,
    required this.interval,
  });

  @override
  State<ParameterChart> createState() => _ParameterChartState();
}

class _ParameterChartState extends State<ParameterChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width - 40) * 0.9),
      height: 250,
      decoration: ShapeDecoration(
        color: const Color(0xfff6f6f6),
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
              color: const Color((0xff987554)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                Icon(
                  widget.icon,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 2),
                Text(
                  widget.title,
                  style: const TextStyle(
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
                    spots: widget.parameterList
                        .mapIndexed((index, element) => FlSpot(
                              index.toDouble(),
                              element.toDouble(),
                            ))
                        .toList(),
                    isCurved: false,
                    dotData: const FlDotData(show: false),
                    barWidth: 3,
                    color: const Color(0xffC4A484),
                  ),
                ],
                borderData: FlBorderData(
                  border: const Border(
                    bottom: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles: AxisTitles(sideTitles: _leftTitles),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
      interval: 3,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });

  SideTitles get _leftTitles => SideTitles(
      interval: widget.interval,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(value.toStringAsFixed(0));
      });
}
