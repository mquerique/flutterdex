import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> get isConnected async {
    final result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
