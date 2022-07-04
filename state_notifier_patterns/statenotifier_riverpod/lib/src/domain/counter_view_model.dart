// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statenotifier_riverpod/src/domain/counter_model.dart';





class CounterViewModel extends StateNotifier<CounterModel> {
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
    
    super.state = value;
  }
}
