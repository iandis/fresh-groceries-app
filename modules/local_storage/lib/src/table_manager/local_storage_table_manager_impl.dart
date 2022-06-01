import 'package:injectable/injectable.dart';
import 'package:local_storage/src/table_manager/local_storage_table_manager.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

@internal
@Singleton(as: LocalStorageTableManager)
class LocalStorageTableManagerImpl implements LocalStorageTableManager {
  final List<String> _tableSchemas = <String>[];

  @internal
  Future<void> createTables(Database database, int version) async {
    if (_tableSchemas.isEmpty) return;

    final Batch batch = database.batch();
    while (_tableSchemas.isNotEmpty) {
      batch.execute(_tableSchemas.removeLast());
    }
    await batch.commit(noResult: true);
  }

  @internal
  void clearTableSchemas() {
    _tableSchemas.clear();
  }

  @override
  void addTable(String schema) {
    _tableSchemas.add(schema);
  }
}
