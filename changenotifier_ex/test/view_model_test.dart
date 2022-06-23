// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:changenotifier_ex/src/domain/counter_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Gist: mote the pattern in how to verify calls to void methods.

class MockCounterViewModel extends Mock implements CounterViewModel {}

void main() {
  late int tCounterValueZero;
  late int tCounterValueOne;
  late CounterViewModel counterViewModel;

  setUp(() {
    tCounterValueZero = 0;
    tCounterValueOne = 1;

    counterViewModel = MockCounterViewModel();
  });

  test(
    "CounterViewModel Test",
    () {
      //stub
      when(() => counterViewModel.increment()).thenReturn(null);

      verifyNever(() => counterViewModel.increment());

      counterViewModel.increment();

      expect(
        tCounterValueOne,
        counterViewModel.counter+1,
      );

      when(() => counterViewModel.decrement()).thenReturn(null);

      verifyNever(() => counterViewModel.decrement());

      counterViewModel.decrement();

      expect(
        tCounterValueZero,
        counterViewModel.counter-1,
      );
    },
  );

}
