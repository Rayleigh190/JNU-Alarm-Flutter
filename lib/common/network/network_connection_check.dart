import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> checkNetworkConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.none)) {
    throw Exception('사용 가능한 네트워크 연결이 없습니다.');
  }
}
