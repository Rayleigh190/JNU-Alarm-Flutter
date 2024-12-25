import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/main/main_screen.dart';
import 'package:jnu_alarm/features/onboarding/view_models/init_view_model.dart';

class InitScreen extends ConsumerWidget {
  static const routeName = "/";

  const InitScreen({super.key});

  void replacementToMainScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    });
  }

  Widget errorScaffold(String message1, String message2) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("오류: $message1"),
            Text("\n$message2"),
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else {
                  exit(0);
                }
              },
              child: const Text("종료하기"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(initProvider).when(
      data: (data) {
        if (data.isFirstRun) {
          debugPrint("InitScreen - isFirstRun");
          replacementToMainScreen(context);
        } else if (data.isUpdated) {
          debugPrint("InitScreen - isUpdated");
          replacementToMainScreen(context);
        } else {
          debugPrint("InitScreen - NoFirstRun & NoUpdated");
          replacementToMainScreen(context);
        }
        return const Scaffold();
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("앱 설정 중..."),
                Gaps.v14,
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        if (error is NoNetworkConnectivityException) {
          return errorScaffold(
            error.message,
            "인터넷을 연결 후 앱을 완전히 재시작 해주세요.",
          );
        } else if (error is ApiInternalServerException) {
          return errorScaffold(
            error.message,
            "신속하게 복구 중입니다. 잠시 후 다시 시도해 주세요.",
          );
        }
        return errorScaffold(
          error.toString(),
          "알 수 없는 오류입니다. 개발자에게 문의하세요.",
        );
      },
    );
  }
}
