import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

import 'analytics_events/analytics_event.dart';

@LazySingleton(as: FirebaseAnalytics)
class AnalyticsLogger extends FirebaseAnalytics {
  void log(AnalyticsEvent analyticsEvent) => logEvent(
        name: analyticsEvent.logEventName,
        parameters: analyticsEvent.parameters,
      );
}
