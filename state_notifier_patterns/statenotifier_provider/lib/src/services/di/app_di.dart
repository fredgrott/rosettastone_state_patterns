// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:statenotifier_provider/src/domain/counter_model.dart';
import 'package:statenotifier_provider/src/domain/counter_view_model.dart';
import 'package:statenotifier_provider/src/presentation/counter_tween.dart';
import 'package:statenotifier_provider/src/presentation/my_app.dart';
import 'package:statenotifier_provider/src/services/logging/console_logger.dart';
import 'package:statenotifier_provider/src/services/logging/iapp_logger.dart';

final MultiProvider appProvider = MultiProvider(
  
  providers: [
    Provider<IAppLogger>(create: (_) => ConsoleLogger(),),
    StateNotifierProvider<CounterViewModel, CounterModel>(
      create: (_) => CounterViewModel(),
      builder: (context, child,) {

        return TweenAnimationBuilder<CounterModel>(
          duration: const Duration(milliseconds: 500),
          tween: CounterTween(end: context.watch<CounterModel>()),
          builder: (context, state, child,) {
            return Provider.value(
              value: state, 
              child: MyApp(),);
          },
        );
      },),
  ],);
