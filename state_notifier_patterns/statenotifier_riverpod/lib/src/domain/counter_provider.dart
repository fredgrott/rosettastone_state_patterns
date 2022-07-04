// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:riverpod/riverpod.dart';
import 'package:statenotifier_riverpod/src/domain/counter_model.dart';
import 'package:statenotifier_riverpod/src/domain/counter_view_model.dart';

// Gist: Provides the globla WidgetRef used with Riverpod's Conusmer Widget

final counterProvider =
    StateNotifierProvider<CounterViewModel, CounterModel>((ref) {
  return CounterViewModel();
});
