import 'package:firebase_analytics/firebase_analytics.dart';


class FirebaseData {

  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static void analyticsInit() {
    analytics.setAnalyticsCollectionEnabled(false);
    // analytics.setAnalyticsCollectionEnabled(true);
  }

}