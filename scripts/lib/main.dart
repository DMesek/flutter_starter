import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/firebase/analytics_logger.dart';
import 'common/firebase/firebase_setup_service.dart';
import 'generated/l10n.dart';
import 'main/app_environment.dart';
import 'router.dart' as router;
import 'theme/themes.dart' as themes;

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  await FirebaseSetupService.initializeFirebase(environment);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvInfo.environment != AppEnvironment.PROD,
      title: EnvInfo.appName,
      theme: themes.primaryTheme,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: AnalyticsLogger()),
      ],
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      routes: router.routes,
    );
  }
}
