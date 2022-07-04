import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifier_riverpod/src/presentation/my_app.dart';
import 'package:statenotifier_riverpod/src/services/logging/riverpod_logger.dart';





void main() async {
  runApp(
    ProviderScope(
      observers: [
        RiverpodLogger(),
      ],
      child: MyApp(),),
  );
}
