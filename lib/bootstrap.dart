import 'dart:async';

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setUpDataDog();

      setupLogging();

      runApp(await builder());
    },
    (Object error, StackTrace stack) async {
      if (kDebugMode) {
        print(error);
      }
    },
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        // Skip prints in release builds
        if (kDebugMode) {
          parent.print(zone, line);
          // TODO(kevin): Send error log to Sentry
        }
      },
    ),
  );
}

Future<void> setUpDataDog() async {
  final configuration = DatadogConfiguration(
    clientToken: 'pubbef495096a6b7c6b921296634a576422',
    env: 'dev',
    site: DatadogSite.us5,
    nativeCrashReportEnabled: true,
    loggingConfiguration: DatadogLoggingConfiguration(),
    rumConfiguration: DatadogRumConfiguration(
      applicationId: 'f63e3b76-490f-442c-acb8-7547c8b67227',
    ),
  );

  final originalOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    FlutterError.presentError(details);

    if (!kDebugMode) {
      DatadogSdk.instance.rum?.handleFlutterError(details);
    }

    originalOnError?.call(details);
  };

  final platformOriginalOnError = PlatformDispatcher.instance.onError;
  PlatformDispatcher.instance.onError = (e, st) {
    if (!kDebugMode) {
      DatadogSdk.instance.rum?.addErrorInfo(
        e.toString(),
        RumErrorSource.source,
        stackTrace: st,
      );
    }

    return platformOriginalOnError?.call(e, st) ?? false;
  };

  await DatadogSdk.instance.initialize(configuration, TrackingConsent.granted);
}

void setupLogging() {
  Logger.root.onRecord.listen((record) {
    if (!kDebugMode) {
      final logger = DatadogSdk.instance.logs?.createLogger(DatadogLoggerConfiguration());

      if (record.level < Level.SEVERE) {
        logger?.info(record.message, errorStackTrace: record.stackTrace);
      } else {
        logger?.error(record.message, errorStackTrace: record.stackTrace);
      }
      // TODO(kevin): Send log to Sentry
    }
  });
}
