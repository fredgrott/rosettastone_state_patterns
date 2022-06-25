// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:statenotifier_provider/src/domain/counter_view_model.dart';
import 'package:statenotifier_provider/src/domain/iapp_logger.dart';

class LoggerMock extends Mock implements IAppLogger {}

void main() {
  group(
    "CounterView Model Test",
    () {
      late final LoggerMock logger;
      late final CounterViewModel counterViewModel;

      setUpAll(() {
        logger = LoggerMock();
        counterViewModel = CounterViewModel()
          ..debugMockDependency<IAppLogger>(logger);
      });
      test(
        "Increment, Update Count, and Log Change",
        () {
          when(() => logger.countChanged(1)).thenReturn(null);

          expect(
            counterViewModel.debugState.count,
            0,
          );

          counterViewModel.increment();

          expect(
            counterViewModel.debugState.count,
            1,
          );
          verify(() => logger.countChanged(1)).called(1);

          verifyNoMoreInteractions(logger);
        },
      );
      test(
        "Decrement, Update Count, and Log Change",
        () {
          when(() => logger.countChanged(-1)).thenReturn(null);

          expect(
            counterViewModel.debugState.count,
            1,
          );

          counterViewModel.decrement();

          expect(
            counterViewModel.debugState.count,
            0,
          );
          verify(() => logger.countChanged(0)).called(1);

          verifyNoMoreInteractions(logger);
        },
      );
    },
  );
}
