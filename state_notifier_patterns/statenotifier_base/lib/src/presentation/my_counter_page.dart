// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statenotifier_base/src/domain/counter_model.dart';
import 'package:statenotifier_base/src/domain/counter_view_model.dart';

class MyCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.select((CounterModel value) => value.count).toString(),
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
                    Provider.of<CounterViewModel>(
                      context,
                      listen: false,
                    ).increment();
                    
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 20.0),
                FloatingActionButton(
                  onPressed: () {
                    Provider.of<CounterViewModel>(
                      context,
                      listen: false,
                    ).decrement();
                    
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
