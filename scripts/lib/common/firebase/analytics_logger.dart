import 'package:firebase_analytics/firebase_analytics.dart';

import 'analytics_events/analytics_event.dart';

class AnalyticsLogger extends FirebaseAnalytics {
  static final AnalyticsLogger _singleton = AnalyticsLogger._internal();

  factory AnalyticsLogger() {
    return _singleton;
  }
  AnalyticsLogger._internal();

  void log(AnalyticsEvent analyticsEvent) => logEvent(
        name: analyticsEvent.logEventName,
        parameters: analyticsEvent.parameters,
      );
}
