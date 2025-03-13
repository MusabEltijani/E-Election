import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();

  Future<bool> checkNetwork() async {
    bool isConnected = false;
    try {
      ConnectivityResult connectivityResult =
          await _networkConnectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        isConnected = false;
      } else {
        isConnected = true;
      }
    } catch (_) {
      isConnected = true;
    }

    return isConnected;
  }
}
