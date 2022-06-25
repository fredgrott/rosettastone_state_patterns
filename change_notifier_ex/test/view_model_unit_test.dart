// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Gist: Notice that we are mocking the binding and then verifying that it has been called as in unit tests
//       we do not have a real running app. We unit test the business side and we mock the Ui behavior.

import 'package:change_notifier_ex/src/domain/counter_view_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterViewModel extends Mock implements CounterViewModel {}

class MockCallbackFunction extends Mock {
  dynamic call();
}

void main() {
  group(
    "CounterViewModel",
    () {
      late CounterViewModel counterViewModel;
      late CounterViewModel realCounterViewModel;

      const int tOne = 1;
      

      setUp(() {
        
        counterViewModel = MockCounterViewModel();

        realCounterViewModel = CounterViewModel();
        
      });

      test(
        "Real int Value is zero",
        () {
          expect(
            realCounterViewModel.value,
            0,
          );
        },
      );

      test(
        "Increments Value And Calls Listeners",
        () {
          when(() => counterViewModel.value).thenReturn(tOne);

          

          counterViewModel.increment();
          expect(
            counterViewModel.value,
            tOne,
          );
          counterViewModel.increment();

          //counterViewModel.addListener(notifyListenerCallback);

          verify<dynamic>(() => counterViewModel.increment()).called(2);
        },
      );

      test(
        "Decrements Value And Calls Listeners",
        () {
          when(() => counterViewModel.value).thenReturn(tOne);

          

          counterViewModel.decrement();
          expect(
            counterViewModel.value,
            tOne,
          );
          counterViewModel.decrement();

          verify<dynamic>(() => counterViewModel.decrement()).called(2);
        },
      );
    },
  );
}
