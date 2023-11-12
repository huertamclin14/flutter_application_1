import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/pages/parameter_page.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/pages/about_page.dart';

import 'package:flutter_application_1/widgets/topcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  int pageIndex = 0;
  void switchPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            pageIndex == 0 ? const Color(0xFF386150) : const Color(0xff6F4E37),
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/ey.png'),
              fit: BoxFit.contain,
              width: 60,
              height: 60,
            ),
            SizedBox(width: 10),
            Text(
              'MUSHROOM',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white70,
                fontFamily: 'Black Han Sans',
              ),
            ),
            Text(
              'Monitoring',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.black54,
                fontFamily: 'Black Han Sans',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.black54,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(8))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Parameters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Harvests',
          ),
        ],
        backgroundColor:
            pageIndex == 0 ? const Color(0xFF386150) : const Color(0xff6F4E37),
        unselectedItemColor:
            pageIndex != 0 ? const Color(0xFF386150) : const Color(0xff6F4E37),
        unselectedIconTheme: IconThemeData(
          color: pageIndex != 0
              ? const Color(0xFF386150)
              : const Color(0xff6F4E37),
        ),
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        currentIndex: pageIndex,
        onTap: switchPage,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffc5e384),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              TopCard(value: 40.5, index: pageIndex),
              const SizedBox(height: 30),
              pageIndex == 0 ? const ParameterPage() : const HistoryPage()
            ],
          ),
        ),
      ),
    );
  }
}
