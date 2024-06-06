import 'package:checklist/src/app.dart';
import 'package:checklist/src/data/database_repository.dart';
import 'package:checklist/src/data/shared_preferences_database.dart';
import 'package:flutter/material.dart';

void main() {
  final DatabaseRepository databaseRepository = SharedPreferencesDatabase();
  runApp(App(databaseRepository: databaseRepository));
}
