import 'package:checklist/src/data/database_repository.dart';
import 'package:checklist/src/features/checklist/domain/check_item.dart';
import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const ChecklistScreen({super.key, required this.databaseRepository});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  // State
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // reload data on every rebuild
    Future<List<CheckItem>> checkListFuture =
        widget.databaseRepository.getCheckList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: checkListFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    // FALL: Future ist komplett und hat Daten!
                    final checklist = snapshot.data!;
                    return ListView.builder(
                      itemCount: checklist.length,
                      itemBuilder: (context, index) {
                        final currentItem = checklist[index];
                        return Card(
                          child: ListTile(
                            title: Text(currentItem.title),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.databaseRepository
                                      .removeItem(currentItem);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState != ConnectionState.done) {
                    // FALL: Sind noch im Ladezustand
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    // FALL: Es gab nen Fehler
                    return const Icon(Icons.error);
                  }
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
                  widget.databaseRepository.addItem(checkItem);
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
