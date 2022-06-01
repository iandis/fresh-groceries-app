import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/src/network/network.dart';

@internal
@LazySingleton(as: Network)
class NetworkImpl implements Network {
  const NetworkImpl(this._connectivity);

  final Connectivity _connectivity;

  @override
  http.Client createClient() => http.Client();

  @override
  Future<bool> get isConnectionAvailable async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();

    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map<bool>(
      (ConnectivityResult result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi,
    );
  }
}
