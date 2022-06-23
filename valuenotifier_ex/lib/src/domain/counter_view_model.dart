// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

// Gist: Note that we can have the CounterViewModel.count as notn private 
//       as we tie it to s ValueListener Builder to avoid having to do a full
//       stateful widget.

class CounterViewModel {
  ValueNotifier<int> count = ValueNotifier(0);

  int increment() {
    return count.value++;
  }

  int decrement() {
    return count.value--;
  }
}
