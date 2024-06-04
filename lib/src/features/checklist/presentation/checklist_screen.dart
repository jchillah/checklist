import 'package:checklist/src/features/checklist/domain/check_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  // State
  final List<CheckItem> _checkList = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _checkList.length,
                itemBuilder: (context, index) {
                  final currentItem = _checkList[index];
                  return Card(
                    child: ListTile(
                      title: Text(currentItem.title),
                      subtitle: Text(
                          DateFormat('dd.MM.yy').format(currentItem.timestamp)),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _checkList.remove(currentItem);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(controller: _controller),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                final checkItem = CheckItem(
                  title: _controller.text,
                  timestamp: DateTime.now(),
                );
                // Textfeld leeren
                _controller.clear();

                // zur Liste adden und build-Methode neu ausführen
                setState(() {
                  _checkList.add(checkItem);
                });
              },
              child: const Text("Hinzufügen"),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
