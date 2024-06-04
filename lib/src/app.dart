import 'package:checklist/src/features/checklist/presentation/checklist_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
      home: const ChecklistScreen(),
    );
  }
}
