import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/network/network_connection_check.dart';

class InternetOverlayWidget extends ConsumerWidget {
  const InternetOverlayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnectedAsync = ref.watch(internetConnectionProvider);

    return isConnectedAsync.when(
      data: (isConnected) {
        if (isConnected) return const SizedBox.shrink();

        return Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.black.withOpacity(0.6),
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, color: Colors.white, size: 60),
                SizedBox(height: 20),
                Text(
                  '인터넷에 연결되어 있지 않습니다.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const SizedBox.shrink(),
    );
  }
}
