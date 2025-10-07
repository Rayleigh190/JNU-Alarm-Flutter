import 'package:jnu_alarm/features/onboarding/view_models/updates/build34.dart';

Future<void> updateApp(int savedBuildNumber) async {
  if (savedBuildNumber < 34) {
    await build34Update();
  }
}
