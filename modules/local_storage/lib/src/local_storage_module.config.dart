// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i6;

import 'config/local_storage_config.dart' as _i3;
import 'local_storage/local_storage.dart' as _i7;
import 'local_storage/local_storage_impl.dart' as _i8;
import 'local_storage_module.dart' as _i9;
import 'table_manager/local_storage_table_manager.dart' as _i4;
import 'table_manager/local_storage_table_manager_impl.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localStorageModule = _$LocalStorageModule();
  await gh.singletonAsync<_i3.LocalStorageConfig>(
      () => localStorageModule.provideLocalStorageConfig,
      preResolve: true);
  gh.singleton<_i4.LocalStorageTableManager>(
      _i5.LocalStorageTableManagerImpl());
  await gh.singletonAsync<_i6.Database>(
      () => localStorageModule.provideSQLiteDatabase(
          get<_i3.LocalStorageConfig>(), get<_i4.LocalStorageTableManager>()),
      preResolve: true);
  gh.lazySingleton<_i7.LocalStorage>(
      () => _i8.LocalStorageImpl(get<_i6.Database>()));
  return get;
}

class _$LocalStorageModule extends _i9.LocalStorageModule {}
