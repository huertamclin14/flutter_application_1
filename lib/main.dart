
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/topcard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kabutech(),
    );
  }
}

class Kabutech extends StatefulWidget {
  const Kabutech({Key? key}) : super(key: key);

  @override
  State<Kabutech> createState() => _KabutechState();
}

class _KabutechState extends State<Kabutech> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA8C96F),
        title: Row(
          children: [
            const Icon(Icons.account_circle, color: Colors.white, size: 50),
            const SizedBox(width: 5),
            const Text(
              'HELLO, USER!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto'),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 24,
          ),
          Padding(padding: EdgeInsets.all(8))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA8C96F), Color(0xFFD9D9D9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopCard(value: 40.435),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: Color(0xFFEDF7ED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        index == 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFA8C96F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'PARAMETERS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        index == 1; 
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEDF7ED),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'HISTORY',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
                  index == 0
                      ? ParameterPage(width: width, height: height)
                      : HistoryPage(width: width, height: height)
          ],
        ),
      ),
    );
  }
}


class ParameterPage extends StatefulWidget {
  final double width;
  final double height;
  const ParameterPage({super.key, required this.width, required this.height});

  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
           width: 158,
          height: 151,
          decoration: ShapeDecoration(
            color: Color(0xFFEDF7ED),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}


class HistoryPage extends StatefulWidget {
  final double width;
  final double height;
  const HistoryPage({super.key, required this.width, required this.height});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}