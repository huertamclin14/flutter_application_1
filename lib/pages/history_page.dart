import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:flutter_application_1/widgets/period_date_picker.dart';
import 'package:flutter_application_1/widgets/history_list.dart';

enum Calendar { day, week, month }

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  DateTime latestHarvest = DateTime.now();
  double latestAmount = 0;
  double totalHarvestAmount = 0;
  int totalHarvestTimes = 0;
  String period = 'daily';
  Calendar calendarView = Calendar.day;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  DateTime initialDate = DateTime.now();
  DateTime startDate = DateTime(2000);
  DateTime endDate = DateTime(2101, 12, 31);
  bool loaded = false;
  List<Map<String, dynamic>> harvests = [{}];

  @override
  void initState() {
    super.initState();
    startDateController.text = 'January 1, 2000';
    endDateController.text = 'December 31, 2101';
    getHarvestsByPeriod('daily');
    db.collection('harvests').orderBy('created_at').snapshots().listen((event) {
      setState(() {
        latestHarvest = event.docs.last.data()['created_at'].toDate();
        latestAmount = event.docs.last.data()['amount'].toDouble();
        totalHarvestAmount = getTotalHarvestAmount(event.docs);
        totalHarvestTimes = event.docs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 500,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ((MediaQuery.of(context).size.width * 0.8)),
                  height: 42,
                  decoration: ShapeDecoration(
                    color: const Color(0XFF6F4E37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HISTORY',
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
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  child: SegmentedButton<Calendar>(
                    segments: const <ButtonSegment<Calendar>>[
                      ButtonSegment<Calendar>(
                        value: Calendar.day,
                        label: Text('Day'),
                        icon: Icon(Icons.calendar_view_day),
                      ),
                      ButtonSegment<Calendar>(
                        value: Calendar.week,
                        label: Text('Week'),
                        icon: Icon(Icons.calendar_view_week),
                      ),
                      ButtonSegment<Calendar>(
                        value: Calendar.month,
                        label: Text(
                          'Month',
                        ),
                        icon: Icon(Icons.calendar_view_month),
                      ),
                    ],
                    selected: <Calendar>{calendarView},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const Color.fromARGB(255, 110, 60, 24);
                        }
                        return const Color(0XFF6F4E37);
                      }),
                    ),
                    onSelectionChanged: (Set<Calendar> newSelection) {
                      setState(() {
                        calendarView = newSelection.first;
                        if (newSelection.first == Calendar.day) {
                          period = 'daily';
                          getHarvestsByPeriod('daily');
                        } else if (newSelection.first == Calendar.week) {
                          period = 'weekly';
                          getHarvestsByPeriod('weekly');
                        } else if (newSelection.first == Calendar.month) {
                          period = 'monthly';
                          getHarvestsByPeriod('monthly');
                        }
                        formatStartDate(startDate);
                        formatEndDate(endDate);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: (screenWidth - 64) * 0.45,
                      child: TextField(
                        controller: startDateController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            size: 24,
                          ),
                          labelText: 'Start Date',
                          hintText: 'Enter start date',
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        readOnly: true,
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) => PeriodDatePicker(
                            language: 'en',
                            title: 'Start Date',
                            period: period,
                            initialDate: initialDate,
                            extend: false,
                            onConfirmed: (dateTime) {
                              formatStartDate(dateTime);
                              setState(() {
                                startDate = dateTime;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (screenWidth - 64) * 0.45,
                      child: TextField(
                        controller: endDateController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            size: 24,
                          ),
                          labelText: 'End Date',
                          hintText: 'Enter end date',
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        readOnly: true,
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) => PeriodDatePicker(
                            language: 'en',
                            title: 'End Date',
                            period: period,
                            initialDate: initialDate,
                            extend: true,
                            onConfirmed: (dateTime) {
                              formatEndDate(dateTime);
                              setState(() {
                                endDate = dateTime;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                HistoryList(
                  period: period,
                  startDate: startDate,
                  endDate: endDate,
                  loaded: loaded,
                  harvests: harvests,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getTotalHarvestAmount(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    double totalSum = 0;
    for (var doc in docs) {
      Map<String, dynamic> data = doc.data();
      if (data.containsKey('amount') && data['amount'] is num) {
        totalSum += data['amount'];
      }
    }
    return totalSum;
  }

  void formatStartDate(DateTime dateTime) {
    if (period == 'daily') {
      String formatted = DateFormat.yMMMd().format(dateTime);
      startDateController.text = formatted;
    } else if (period == 'weekly') {
      int weekNumber = getISOWeekNumber(dateTime);
      startDateController.text = 'Week $weekNumber, ${dateTime.year} ';
    } else {
      String formattedMonth = DateFormat.yMMM().format(dateTime);
      startDateController.text = formattedMonth;
    }
  }

  void formatEndDate(DateTime dateTime) {
    if (period == 'daily') {
      String formatted = DateFormat.yMMMd().format(dateTime);
      endDateController.text = formatted;
    } else if (period == 'weekly') {
      int weekNumber = getISOWeekNumber(dateTime);
      endDateController.text = 'Week $weekNumber, ${dateTime.year} ';
    } else {
      String formattedMonth = DateFormat.yMMM().format(dateTime);
      endDateController.text = formattedMonth;
    }
  }

  int getISOWeekNumber(DateTime dateTime) {
    DateTime jan1 = DateTime(dateTime.year, 1, 1);
    int jan1Weekday = jan1.weekday;
    int daysToAdd = (jan1Weekday <= 4) ? (1 - jan1Weekday) : (8 - jan1Weekday);
    DateTime firstThursday = jan1.add(Duration(days: daysToAdd));
    int weekNumber =
        ((dateTime.difference(firstThursday).inDays) / 7).ceil() + 1;

    return weekNumber;
  }

  void getHarvestsByPeriod(String period) async {
    setState(() {
      loaded = false;
    });
    QuerySnapshot snapshot = await db
        .collection('harvests')
        .orderBy('created_at', descending: true)
        .get();
    Map<String, double> aggregatedData = {};
    if (period == 'daily') {
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        DateTime createdAt = data['created_at'].toDate();
        double amount = data['amount'].toDouble();

        String dateKey =
            "${createdAt.year}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}";

        if (aggregatedData.containsKey(dateKey)) {
          aggregatedData[dateKey] = aggregatedData[dateKey] ?? 0 + amount;
        } else {
          aggregatedData[dateKey] = amount;
        }
      }
    } else if (period == 'weekly') {
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        DateTime? createdAt = data['created_at']?.toDate();
        double? amount = data['amount']?.toDouble();

        if (createdAt != null && amount != null) {
          int weekNumber = getISOWeekNumber(createdAt);
          String weekKey = '${createdAt.year}-W$weekNumber';

          if (aggregatedData.containsKey(weekKey)) {
            aggregatedData[weekKey] = aggregatedData[weekKey] ?? 0 + amount;
          } else {
            aggregatedData[weekKey] = amount;
          }
        }
      }
    } else {
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        DateTime createdAt = data['created_at'].toDate();
        double amount = data['amount'].toDouble();

        String monthYearKey = "${createdAt.year}-${createdAt.month}";

        if (aggregatedData.containsKey(monthYearKey)) {
          aggregatedData[monthYearKey] =
              aggregatedData[monthYearKey] ?? 0 + amount;
        } else {
          aggregatedData[monthYearKey] = amount;
        }
      }
    }
    List<Map<String, dynamic>> outputList = aggregatedData.entries.map((entry) {
      return {
        'date': entry.key,
        'amount': entry.value,
      };
    }).toList();

    setState(() {
      harvests = outputList;
      loaded = true;
    });
  }
}
