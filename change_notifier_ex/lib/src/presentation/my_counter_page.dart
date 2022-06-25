// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:change_notifier_ex/src/domain/counter_view_model.dart';
import 'package:flutter/material.dart';

class MyCounterPage extends StatelessWidget {
  final CounterViewModel counterViewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: counterViewModel,
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  counterViewModel.value.toString(),
                  style: const TextStyle(fontSize: 80.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        counterViewModel.increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 20.0),
                    FloatingActionButton(
                      onPressed: () {
                        counterViewModel.decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
