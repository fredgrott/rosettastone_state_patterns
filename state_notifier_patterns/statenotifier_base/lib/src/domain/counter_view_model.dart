// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:statenotifier_base/src/domain/counter_model.dart';
import 'package:statenotifier_base/src/domain/iapp_logger.dart';



class CounterViewModel extends StateNotifier<CounterModel> with LocatorMixin {
  CounterViewModel() : super(CounterModel(0));

  void increment() {
    state = CounterModel(state.count + 1);
  }

  void decrement() {
    state = CounterModel(state.count - 1);
  }

  @override
  @protected
  set state(CounterModel value) {
    if (state.count != value.count) {
      read<IAppLogger>().countChanged(value.count);
    }
    super.state = value;
  }
}
