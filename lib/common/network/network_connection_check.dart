import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';

Future<void> checkNetworkConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (!(connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.mobile))) {
    throw const NetworkConnectivityException.noNetwork(
        "인터넷이 연결되어 있지 않습니다. 연결 후 재시도 해주세요.");
  }
}

Future<bool> isNetworkConnected() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.mobile)) return true;
  return false;
}
