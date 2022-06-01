import 'package:http/http.dart';

abstract class Network {
  Future<bool> get isConnectionAvailable;

  Stream<bool> get onConnectivityChanged;

  Client createClient();
}
