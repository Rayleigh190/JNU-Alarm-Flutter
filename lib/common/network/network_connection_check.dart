import 'package:flutter_riverpod/flutter_riverpod.dart';
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

final internetConnectionProvider = StreamProvider<bool>((ref) async* {
  final checker = InternetConnectionChecker.instance;

  // 첫 실행 이벤트 처리
  bool hasConnected = await checker.hasConnection;
  yield hasConnected;

  // 이후 이벤트 처리
  final statusStream = checker.onStatusChange.map(
    (status) => status == InternetConnectionStatus.connected,
  );
  yield* hasConnected ? statusStream.skip(1) : statusStream;
});
