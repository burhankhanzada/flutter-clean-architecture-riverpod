import 'package:flutter/material.dart';
import 'package:flutter_project/main/app.dart';
import 'package:flutter_project/main/app_env.dart';
import 'package:flutter_project/main/observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: MyApp(),
    ),
  );
}
