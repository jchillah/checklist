import 'package:checklist/src/features/checklist/domain/check_item.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Simulierte Datenbank
  final List<CheckItem> _checkList = [];

  // Methoden der Schablone `DatabaseRepository`
  @override
  Future<void> addItem(CheckItem checkItem) async {
    _checkList.add(checkItem);
  }

  @override
  Future<void> removeItem(CheckItem checkItem) async {
    _checkList.remove(checkItem);
  }

  @override
  Future<List<CheckItem>> getCheckList() async {
    await Future.delayed(const Duration(seconds: 2));
    return _checkList;
  }
}
