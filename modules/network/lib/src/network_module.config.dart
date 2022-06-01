// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'network/network.dart' as _i4;
import 'network/network_impl.dart' as _i5;
import 'network_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Connectivity>(networkModule.provideConnectivity);
  gh.lazySingleton<_i4.Network>(() => _i5.NetworkImpl(get<_i3.Connectivity>()));
  return get;
}

class _$NetworkModule extends _i6.NetworkModule {}
