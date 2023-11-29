import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isoweek/isoweek.dart';

class HistoryList extends StatefulWidget {
  final String period;
  final DateTime startDate;
  final DateTime endDate;
  final List<Map<String, dynamic>> harvests;
  final bool loaded;
  const HistoryList({
    super.key,
    required this.period,
    required this.startDate,
    required this.endDate,
    required this.loaded,
    required this.harvests,
  });

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    if (!widget.loaded) {
      return CircularProgressIndicator(color: Colors.blue.shade600);
    }
    List<dynamic> filteredHarvests = [];
    for (Map<String, dynamic> harvest in widget.harvests) {
      if (widget.period == 'daily') {
        DateTime dateTime =
            DateTime.parse(harvest['date']).add(const Duration(hours: 8));
        if (dateTime.isAfter(widget.startDate) &&
            dateTime.isBefore(widget.endDate.add(const Duration(hours: 8)))) {
          filteredHarvests.add(harvest);
        }
      } else if (widget.period == 'weekly') {
        Week week = Week.fromISOString(harvest['date']);
        DateTime firstWeekDay = week.day(0);
        DateTime lastWeekDay = week.day(6);
        if (lastWeekDay.isAfter(widget.startDate) &&
            firstWeekDay.isBefore(widget.endDate)) {
          filteredHarvests.add(harvest);
        }
      } else if (widget.period == 'monthly') {
        DateTime firstMonthDay =
            DateTime(widget.startDate.year, widget.startDate.month);
        DateTime lastMonthDay =
            DateTime(widget.endDate.year, widget.endDate.month, 30);
        DateTime dateTime = DateTime.parse(harvest['date'] + '-02');
        if (dateTime.isAfter(firstMonthDay) &&
            dateTime.isBefore(lastMonthDay)) {
          filteredHarvests.add(harvest);
        }
      }
    }
    if (filteredHarvests.isEmpty) {
      return const Center(
        child: Text(
          'No harvests falls in the given date ranges',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      height: 350,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          String dateString = '';
          if (widget.period == 'daily') {
            DateTime date = DateTime.parse(filteredHarvests[index]['date']);
            dateString = DateFormat.yMMMMd().format(date);
          } else if (widget.period == 'weekly') {
            String tempDateString = filteredHarvests[index]['date'].toString();
            dateString =
                'Week ${tempDateString.substring(6)}, ${tempDateString.substring(0, 4)}';
          } else {
            List<String> months = [
              'January',
              'February',
              'March',
              'April',
              'May',
              'June',
              'July',
              'August',
              'September',
              'October',
              'November',
              'December'
            ];
            String tempDateString = filteredHarvests[index]['date'].toString();
            dateString =
                '${months[int.parse(tempDateString.split('-')[1]) - 1]} ${tempDateString.split('-')[0]}';
          }
          return Container(
            width: ((MediaQuery.of(context).size.width * 0.75)),
            height: 80,
            decoration: ShapeDecoration(
              color: const Color(0xFFEDF7ED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                Container(
                  width: ((MediaQuery.of(context).size.width - 10) * 0.3),
                  height: 63,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF6F4E37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        filteredHarvests[index]['amount'].toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.10,
                          letterSpacing: 0.46,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        'kg',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 1.10,
                          letterSpacing: 0.46,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      dateString,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        height: 1.10,
                        letterSpacing: 0.46,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: filteredHarvests.length,
      ),
    );
  }
}
