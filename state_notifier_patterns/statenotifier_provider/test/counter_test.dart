// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:statenotifier_provider/src/domain/counter_model.dart';

import 'package:statenotifier_provider/src/presentation/my_counter_page.dart';

import 'common.dart';
import 'wrap_with_material_wrapper.dart';

// Gist: The StateNotifierProvider and StateNotifierBuilder combo translates to:
//         InheritedProvider.value->child->StateNotifierBuiler<value>->Provider.value
//
//         So I need StateNotifierProvider to test?

void main() {
  group(
    "Counter Tests",
    () {
      late final TestCounterViewModelNotifier notifier;

      setUpAll(() {
        notifier = TestCounterViewModelNotifier(const CounterModel(0));
      });

      testWidgets(
        "Counter Increments by One",
        (tester) async {
          await tester.pumpWidget(
            StateNotifierBuilder<CounterModel>(
              builder: (
                BuildContext context,
                value,
                child,
              ) {
                return Provider<TestCounterViewModelNotifier>.value(
                  value: notifier,
                  builder: (context, child,) {
                    return wrapWithMaterialWrapper(MyCounterPage());
                  },
                  
                );
              },
              stateNotifier: notifier,
            ),
          );

          expect(
            find.text(0.toStringAsFixed(0)),
            findsOneWidget,
          );
          expect(
            find.text(1.toStringAsFixed(0)),
            findsNothing,
          );

          await tester.tap(find.byTooltip("Increment"));
          await tester.pump();

          expect(
            find.text(0.toStringAsFixed(0)),
            findsNothing,
          );
          expect(
            find.text(1.toStringAsFixed(0)),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        "Counter Decrements by One",
        (tester) async {
          await tester.pumpWidget(
            StateNotifierBuilder<CounterModel>(
              builder: (
                BuildContext context,
                value,
                child,
              ) {
                return Provider<TestCounterViewModelNotifier>.value(
                  value: notifier,
                  builder: (
                    context,
                    child,
                  ) {
                    return wrapWithMaterialWrapper(MyCounterPage());
                  },
                );
              },
              stateNotifier: notifier,
            ),
          );

          expect(
            find.text(0.toStringAsFixed(0)),
            findsOneWidget,
          );
          expect(
            find.text(1.toStringAsFixed(0)),
            findsNothing,
          );

          await tester.tap(find.byTooltip("Decrement"));
          await tester.pump();

          expect(
            find.text(0.toStringAsFixed(0)),
            findsNothing,
          );
          expect(
            find.text((-1).toStringAsFixed(0)),
            findsOneWidget,
          );
        },
      );
    },
  );
}
