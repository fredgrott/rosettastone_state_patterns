// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:mocktail/mocktail.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:statenotifier_provider/src/domain/counter_model.dart';
import 'package:statenotifier_provider/src/domain/counter_view_model.dart';
import 'package:statenotifier_provider/src/services/logging/iapp_logger.dart';

class CounterViewModelMock extends Mock implements CounterViewModel {}

// This is the only way to test Notifiers to get proper access to specific things.
class TestCounterViewModelNotifier extends StateNotifier<CounterModel> with LocatorMixin {

  CounterModel get currentState => state;

  final void Function()? onInitState;
  final void Function(Locator watch)? onUpdate;
  TestCounterViewModelNotifier(CounterModel state,{
    this.onInitState,
    this.onUpdate,
  }) : super(state);

  void increment() {
    state = CounterModel(state.count + 1);
  }

  void decrement() {
    state = CounterModel(state.count - 1);
  }

  @override
  // ignore: unnecessary_overrides, remvove protected
  Locator get read => super.read;

  @override
  void initState() {
    onInitState?.call();
  }

  @override
  void update(T Function<T>() watch) {
    onUpdate?.call(watch);
  }

  



}
