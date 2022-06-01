import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:local_storage/src/config/local_storage_config.dart';
import 'package:local_storage/src/local_storage_module.config.dart';
import 'package:local_storage/src/table_manager/local_storage_table_manager.dart';
import 'package:local_storage/src/table_manager/local_storage_table_manager_impl.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

@injectableInit
Future<void> initLocalStorageModule(GetIt getIt) => $initGetIt(getIt);

@internal
@module
abstract class LocalStorageModule {
  @singleton
  @preResolve
  Future<LocalStorageConfig> get provideLocalStorageConfig async {
    try {
      final String dbDirectory = await getDatabasesPath();
      return LocalStorageConfig(
        dbFileName: 'fgls.db',
        dbDirectory: dbDirectory,
        dbVersion: 1,
      );
    } catch (error, stackTrace) {
      log(
        'An error occurred when getting database path.',
        name: 'LocalStorageModule.provideLocalStorageConfig',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @singleton
  @preResolve
  Future<DatabaseExecutor> provideSQLiteDatabase(
    LocalStorageConfig localStorageConfig,
    LocalStorageTableManager localStorageTableManager,
  ) async {
    try {
      final LocalStorageTableManagerImpl tableManager =
          localStorageTableManager as LocalStorageTableManagerImpl;

      return await openDatabase(
        localStorageConfig.dbPath,
        onCreate: tableManager.createTables,
        version: localStorageConfig.dbVersion,
      );
    } catch (error, stackTrace) {
      log(
        'An error occurred when opening sqlite database.',
        name: 'LocalStorageModule.provideSQLiteDatabase',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
