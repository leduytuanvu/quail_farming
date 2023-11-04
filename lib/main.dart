import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quail_farming/app.dart';
import 'package:quail_farming/core/environments/config_manager.dart';
import 'package:quail_farming/core/services/bloc_observer.dart';
import 'package:quail_farming/core/services/error_handler.dart';
import 'package:quail_farming/core/services/injection_container.dart';

Future<void> main() async {
  // Handler error global
  await runZonedGuarded(() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      ErrorHandler.handleException(details.exception, details.stack);
    };
    WidgetsFlutterBinding.ensureInitialized();
    ConfigManager.setEnvironment(Environment.dev);
    // Set up injector
    await setupInjector();
    // Set up bloc observer
    Bloc.observer = BlocObservers();
    runApp(const App());
  }, (error, stackTrace) {
    ErrorHandler.handleException(error, stackTrace);
  });
}
