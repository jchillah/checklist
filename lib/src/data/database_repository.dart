import 'package:checklist/src/features/checklist/domain/check_item.dart';

abstract class DatabaseRepository {
  Future<List<CheckItem>> getCheckList();
  Future<void> addItem(CheckItem checkItem);
  Future<void> removeItem(CheckItem checkItem);
}
