// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:statenotifier_provider/src/domain/counter_model.dart';

import 'common.dart';

// Gist:  In the app setup I have StateNotifierProvider at the runApp function.
//        In this wrapper I probably need it in the same place about the MaterialApp
//        widget.

Widget wrapWithMaterialWrapper(
  Widget screen,
  TestCounterViewModelNotifier notifier,
) {
  return StateNotifierProvider<TestCounterViewModelNotifier, CounterModel>(
    create: (_) => notifier,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: screen,
    ),
  );


}
