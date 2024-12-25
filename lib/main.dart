import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/analytics_service.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/features/main/main_screen.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';
import 'package:jnu_alarm/features/onboarding/views/init_screen.dart';
import 'package:jnu_alarm/features/onboarding/views/onboarding_screen.dart';
import 'package:jnu_alarm/features/setting/constants/business_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/college_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/depart_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/main_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/sg_school_setting_const.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:jnu_alarm/features/setting/view_models/setting_section_view_model.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/business_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/college_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/depart_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/info_screen.dart';
import 'package:jnu_alarm/features/setting/views/sg_school_setting_screen.dart';
import 'package:jnu_alarm/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AnalyticsService.setAnalyticsCollectionEnabled(true);

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
        mainNoticeSettingProvider.overrideWith(() =>
            NoticeSettingViewModel(repository, mainSettingSectionGroupWithDev)),
        collegeNoticeSettingProvider.overrideWith(() =>
            NoticeSettingViewModel(repository, collegeSettingSectionGroup)),
        departNoticeSettingProvider.overrideWith(() =>
            NoticeSettingViewModel(repository, departSettingSectionGroup)),
        sgSchoolNoticeSettingProvider.overrideWith(() =>
            NoticeSettingViewModel(repository, sgSchoolSettingSectionGroup)),
        businessNoticeSettingProvider.overrideWith(() =>
            NoticeSettingViewModel(repository, businessSettingSectionGroup)),
        noticeProvider.overrideWith(() => NoticeViewModel(repository)),
        settingSectionProvider
            .overrideWith(() => SettingSectionViewModel(repository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: AnalyticsService.instance);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '전대알림',
      themeMode: ThemeMode.system,
      navigatorObservers: <NavigatorObserver>[observer],
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F4F0),
        primaryColor: const Color(0xFFb8ed55),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFf5f4f0).withOpacity(0.9),
          surfaceTintColor: const Color(0xFFf5f4f0),
          centerTitle: false,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.grey),
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
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
        dialogTheme: const DialogTheme(
          barrierColor: Colors.white10,
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.grey),
      ),
      initialRoute: "/",
      routes: {
        InitScreen.routeName: (context) => const InitScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        CollegeSettingScreen.routeName: (context) =>
            const CollegeSettingScreen(),
        DepartSettingScreen.routeName: (context) => const DepartSettingScreen(),
        SgSchoolSettingScreen.routeName: (context) =>
            const SgSchoolSettingScreen(),
        BusinessettingScreen.routeName: (context) =>
            const BusinessettingScreen(),
        InfoScreen.routeName: (context) => const InfoScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == WebViewScreen.routeName) {
          final args = settings.arguments as WebViewScreenArgs;
          return CupertinoPageRoute(
            settings: const RouteSettings(name: WebViewScreen.routeName),
            builder: (context) => WebViewScreen(
              title: args.title,
              body: args.body,
              link: args.link,
            ),
          );
        } else if (settings.name == MainScreen.routeName) {
          return _fadeRoute(const MainScreen(), MainScreen.routeName);
        }
        return null;
      },
    );
  }

  PageRouteBuilder _fadeRoute(Widget page, String routeName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }
}
