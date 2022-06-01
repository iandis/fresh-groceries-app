import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/src/network_module.config.dart';

@injectableInit
void initNetworkModule(GetIt getIt) => $initGetIt(getIt);

@internal
@module
abstract class NetworkModule {
  @singleton
  Connectivity get provideConnectivity => Connectivity();
}
