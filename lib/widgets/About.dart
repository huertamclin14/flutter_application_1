import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About KabuTech',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFFA8C96F),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
      body: const Padding(
        padding:  EdgeInsets.all(20.0),
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
              'Welcome to the Mushroom Monitoring System. This app helps you track and monitor mushroom growth and conditions for optimal cultivation.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
