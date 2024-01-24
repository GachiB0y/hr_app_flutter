import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/rest_clients/firebase_api/firebase_api.dart';
import 'package:hr_app_flutter/core/utils/bloc_observable.dart';
import 'package:hr_app_flutter/core/utils/logger.dart';
import 'package:hr_app_flutter/features/app/widget/app.dart';
import 'package:hr_app_flutter/features/initialiazation/logic/initialization_processor.dart';
import 'package:hr_app_flutter/features/initialiazation/logic/initialization_steps.dart';
import 'package:hr_app_flutter/features/initialiazation/model/initialization_hook.dart';

/// Ephemerally initializes the app and prepares it for use.
Future<void>? _$initializeAndRun;

/// A class which is responsible for initialization and running the app.
final class AppRunner with InitializationSteps, InitializationProcessor {
  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun(InitializationHook hook) =>
      _$initializeAndRun ??= Future<void>(() async {
        final bindings = WidgetsFlutterBinding.ensureInitialized()
          ..deferFirstFrame();
        // Preserve splash screen
        // FlutterNativeSplash.preserve(widgetsBinding: bindings);

        // Override logging
        FlutterError.onError = logger.logFlutterError;
        PlatformDispatcher.instance.onError = logger.logPlatformDispatcherError;

        // Setup bloc observer and transformer
        Bloc.observer = const AppBlocObserver();
        Bloc.transformer = bloc_concurrency.sequential();
        // await Future.delayed(const Duration(seconds: 5));

        //Setup Firebase
        if (Platform.isIOS) {
          await Firebase.initializeApp(
            options: const FirebaseOptions(
                apiKey: "AIzaSyAEnF7uI13l_Ejgz1P5E5D8oL3hFqhB0PY",
                appId: "1:399963694781:ios:e041ec4c5885ee609139d4",
                messagingSenderId: "399963694781",
                projectId: "hrapp-8bcdb"),
          );
        } else {
          await Firebase.initializeApp(
              options: const FirebaseOptions(
                  apiKey: "AIzaSyD9dkbYMqYKI5fkIeFkQBzV3gXSkQhpw28",
                  appId: "1:399963694781:android:207b472798a961589139d4",
                  messagingSenderId: "399963694781",
                  projectId: "hrapp-8bcdb"));
        }
        await FirebaseApi().initNotifications();

        final result = await processInitialization(
          steps: initializationSteps,
          hook: hook,
          // factory: this,
        );

        bindings.addPostFrameCallback((_) {
          // Closes splash screen, and show the app layout.
          bindings.allowFirstFrame();
        });

        // Attach this widget to the root of the tree.
        App(result: result).attach(null);
      });
}
