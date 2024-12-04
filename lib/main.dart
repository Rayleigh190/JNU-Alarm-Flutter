import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/main/main_screen.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // make flutter draw behind navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // make SharedPreferences instance
  final preferences = await SharedPreferences.getInstance();
  final repository = NoticeSettingRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        noticeSettingProvider
            .overrideWith(() => NoticeSettingViewModel(repository))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '전대알림',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F4F0),
        primaryColor: const Color(0xFFb8ed55),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFf5f4f0).withOpacity(0.9),
          surfaceTintColor: const Color(0xFFf5f4f0),
          centerTitle: false,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFb8ed55),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF121212).withOpacity(0.9),
          surfaceTintColor: const Color(0xFF121212),
          centerTitle: false,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
