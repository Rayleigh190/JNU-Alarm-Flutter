import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';

Future<void> checkNetworkConnection() async {
  final bool isConnected =
      await InternetConnectionChecker.instance.hasConnection;
  if (!isConnected) {
    throw const NetworkConnectivityException.noNetwork(
        "인터넷이 연결되어 있지 않습니다. 연결 후 재시도 해주세요.");
  }
}
