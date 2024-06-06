import 'package:checklist/src/data/database_repository.dart';
import 'package:checklist/src/features/checklist/presentation/checklist_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const App({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
      home: ChecklistScreen(databaseRepository: databaseRepository),
    );
  }
}
