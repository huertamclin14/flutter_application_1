import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/services/appstate.dart';

import 'package:flutter_application_1/pages/parameter_page.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/pages/about_page.dart';

import 'package:flutter_application_1/widgets/app_drawer.dart';
import 'package:flutter_application_1/widgets/topcard.dart';

class HomePage extends StatefulWidget {
  final AppState appState;
  const HomePage({
    Key? key,
    required this.appState,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldKey,
      drawer: AppDrawer(
        appState: widget.appState,
      ),
      appBar: AppBar(
        backgroundColor:
            pageIndex == 0 ? const Color(0xff987554) : const Color(0xff987554),
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            }, // Image tapped
            splashColor: Colors.white10, // Splash color over image
            child: Ink.image(
              fit: BoxFit.contain, // Fixes border issues
              width: 16,
              height: 16,
              image: const AssetImage('images/ey.png'),
            ),
          ),
        ),
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              color: Colors.white70,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(
                    appState: widget.appState,
                  ),
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
            pageIndex == 0 ? const Color(0xff987554) : const Color(0xff987554),
        unselectedItemColor:
            pageIndex != 0 ? Colors.white54 : Colors.white54,
        unselectedIconTheme: IconThemeData(
          color: pageIndex != 0
              ? Colors.white54
              : Colors.white54,
        ),
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        currentIndex: pageIndex,
        onTap: switchPage,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
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
