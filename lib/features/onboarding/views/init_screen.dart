import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/main/main_screen.dart';
import 'package:jnu_alarm/features/onboarding/view_models/init_view_model.dart';

class InitScreen extends ConsumerWidget {
  static const routeName = "/";

  const InitScreen({super.key});

  void replacementToMainScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        FadeInPageRoute(
          page: const MainScreen(),
        ),
      );
    });
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
        // TODO: 예외처리 고도화 필요
        debugPrint("InitScreen - $error");
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error.toString()),
                const Text("\n인터넷을 연결 후 앱을 완전히 재시작 해주세요."),
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
      },
    );
  }
}

class FadeInPageRoute extends PageRouteBuilder {
  final Widget page;

  FadeInPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 1000),
        );
}
