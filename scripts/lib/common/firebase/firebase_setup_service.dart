import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../../main/app_environment.dart';

abstract class FirebaseSetupService {
  static Future initializeFirebase(AppEnvironment environment) async {
    await Firebase.initializeApp();
    _initializeAnalytics(environment);
    _initializeCrashlytics(environment);
  }

  static Future _initializeCrashlytics(AppEnvironment environment) async {
    try {
      final _crashlyticsInstance = FirebaseCrashlytics.instance;

      if (!_shouldEnableCrashlytics(environment)) {
        await _crashlyticsInstance.setCrashlyticsCollectionEnabled(false);
      } else if (!_crashlyticsInstance.isCrashlyticsCollectionEnabled) {
        await _crashlyticsInstance.setCrashlyticsCollectionEnabled(true);
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      }

      // ignore: empty_catches
    } catch (ignore) {}
  }

  static Future _initializeAnalytics(AppEnvironment environment) async =>
      FirebaseAnalytics()
          .setAnalyticsCollectionEnabled(environment == AppEnvironment.PROD);

  static bool _shouldEnableCrashlytics(AppEnvironment environment) =>
      environment == AppEnvironment.PROD;
}
