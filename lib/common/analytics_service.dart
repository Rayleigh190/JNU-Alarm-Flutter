import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final _instance = FirebaseAnalytics.instance;

  static FirebaseAnalytics get instance => _instance;

  static void setAnalyticsCollectionEnabled(bool value) {
    _instance.setAnalyticsCollectionEnabled(value);
  }
}
