import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../main/app_environment.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EnvInfo.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).yes,
            ),
            Text(
              'sth',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FirebaseCrashlytics.instance.crash(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
