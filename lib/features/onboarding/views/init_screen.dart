import 'package:flutter/material.dart';
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
    final initNotifier = ref.read(initProvider.notifier);

    return FutureBuilder(
      future: initNotifier.initialize(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        } else {
          final appState = ref.watch(initProvider);
          if (appState.isFirstRun) {
            replacementToMainScreen(context);
          } else if (appState.isUpdated) {
            replacementToMainScreen(context);
          } else {
            replacementToMainScreen(context);
          }
          return const Scaffold();
        }
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
