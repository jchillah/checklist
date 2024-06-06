import 'package:checklist/src/features/checklist/domain/check_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database_repository.dart';

class SharedPreferencesDatabase implements DatabaseRepository {
  static const String checklistKey = 'checklist';

  @override
  Future<void> addItem(CheckItem checkItem) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> checklist = prefs.getStringList(checklistKey) ?? [];
    checklist.add(checkItem.toString());
    await prefs.setStringList(checklistKey, checklist);
  }

  @override
  Future<void> removeItem(CheckItem checkItem) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> checklist = prefs.getStringList(checklistKey) ?? [];
    checklist.remove(checkItem.toString());
    await prefs.setStringList(checklistKey, checklist);
  }

  @override
  Future<List<CheckItem>> getCheckList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> checklist = prefs.getStringList(checklistKey) ?? [];
    return checklist.map((item) => CheckItem.fromString(item)).toList();
  }
}
