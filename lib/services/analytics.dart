import 'package:firebase_analytics/firebase_analytics.dart';


class Analytics {

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  get init {
    // analytics.setAnalyticsCollectionEnabled(false);
    analytics.setAnalyticsCollectionEnabled(true);
  }

}