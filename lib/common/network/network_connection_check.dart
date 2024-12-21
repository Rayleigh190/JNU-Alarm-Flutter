import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';

Future<void> checkNetworkConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.none)) {
    throw const NetworkConnectivityException.noNetwork("사용 가능한 네트워크가 없습니다.");
  }
}
