import 'package:meta/meta.dart';
import 'package:path/path.dart' as path show join;

@sealed
class LocalStorageConfig {
  LocalStorageConfig({
    required this.dbFileName,
    required this.dbDirectory,
    required this.dbVersion,
  });

  final String dbFileName;

  final String dbDirectory;

  late final String dbPath = path.join(dbDirectory, dbFileName);

  final int dbVersion;
}
