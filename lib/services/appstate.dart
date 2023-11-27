import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database.dart';

class AppState extends ChangeNotifier {
  late KabutechDatabase database;
  Map<String, dynamic> settings = {
    'language': 'en',
    'font_scale': 1,
  };

  void initializeDatabase(KabutechDatabase initializedDatabase) {
    database = initializedDatabase;
  }

  void initializeSettings(Map<String, dynamic> initializedSettings) {
    settings = initializedSettings;
  }
}
