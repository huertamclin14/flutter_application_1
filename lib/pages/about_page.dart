import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_application_1/services/appstate.dart';

class AboutPage extends StatelessWidget {
  final AppState appState;
  const AboutPage({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About KabuTech',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color(0xffc5e384),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 56.0),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mushroom Monitoring Application',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Version: 1.0.0',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Developer: HMO Group',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '       Introducing the Mushroom Monitoring System, a groundbreaking mobile app that redefines mushroom cultivation. With this app, you can access comprehensive data on temperature, humidity, CO2 levels, and light intensity, allowing you to optimize your growth conditions. Receive real-time alerts and track historical data for your harvests and parameter readings. Whether you are an enthusiast or a professional, our app provides the precision, convenience, and success you need in mushroom cultivation. Embrace the future of mushroom growing right at your fingertips. Happy growing!',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              LottieBuilder.asset('assets/mushroom.json')
            ],
          ),
        ),
      ),
    );
  }
}
