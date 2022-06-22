// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counterbase_ex/src/domain/counter_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
      when(() => counterViewModel.increment()).thenReturn(tCounterValueOne);

      verifyNever(() => counterViewModel.increment());

      counterViewModel.increment();

      expect(
        tCounterValueOne,
        counterViewModel.counter,
      );

      when(() => counterViewModel.decrement()).thenReturn(tCounterValueZero);

      verifyNever(() => counterViewModel.decrement());

      counterViewModel.decrement();

      expect(
        tCounterValueZero,
        counterViewModel.counter,
      );
    },
  );
}
