import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectivity);

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final connectivityResulst = await connectivity.checkConnectivity();
    if (connectivityResulst == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
