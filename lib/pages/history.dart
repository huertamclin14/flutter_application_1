import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final double width;
  final double height;
  final List<dynamic> harvests;

  const HistoryPage(
      {super.key,
      required this.width,
      required this.height,
      required this.harvests});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> harvests = widget.harvests;
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
                      color: Color(0XFF6F4E37),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: ((MediaQuery.of(context).size.width * 0.8)),
                    height: 400,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: harvests.length,
                      itemBuilder: (BuildContext context, int index) {
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
                        DateTime datetime =
                            harvests[index]['created_at'].toDate();
                        String date =
                            '${months[datetime.month - 1]} ${datetime.day}, ${datetime.year}';
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
                                width:
                                    ((MediaQuery.of(context).size.width - 10) *
                                        0.3),
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
                                      harvests[index]['amount']
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        height: 1.10,
                                        letterSpacing: 0.46,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
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
                              const SizedBox(
                                width: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    date,
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
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),);
  }
}
