import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/main/main_screen.dart';
import 'package:jnu_alarm/features/onboarding/view_models/init_view_model.dart';

class InitScreen extends ConsumerStatefulWidget {
  static const routeName = "/";

  const InitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends ConsumerState {
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
  Widget build(BuildContext context) {
    return ref.watch(initProvider).when(
      data: (data) {
        if (data.loadingMeassage != null) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "${data.loadingMeassage}하는 중이에요.\n화면을 나가지 말아 주세요!",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                  ),
                ),
                Gaps.v80,
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
                Gaps.v80,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size20,
                      horizontal: Sizes.size10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text("💡", style: TextStyle(fontSize: 30)),
                        Gaps.h10,
                        Flexible(
                          child: Text(
                              "필요한 기능이 있으신가요? 설정 > 문의 및 제안하기를 통해 여러분의 목소리를 들려주세요!"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          if (data.isFirstRun == true) {
            debugPrint("InitScreen - isFirstRun");
            replacementToMainScreen(context);
          } else if (data.isUpdated == true) {
            debugPrint("InitScreen - isUpdated");
            replacementToMainScreen(context);
          } else {
            debugPrint("InitScreen - NoFirstRun & NoUpdated");
            replacementToMainScreen(context);
          }
          return const Scaffold();
        }
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
      loading: () {
        return const Scaffold();
      },
    );
  }
}
