// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:widget_view_arch/widget_view.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _CounterPageController createState() => _CounterPageController();
}

class _CounterPageController extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) => _CounterPageView(this);
}

// Note since its a stateful widget we can use the state var
class _CounterPageView extends WidgetView<CounterPage, _CounterPageController> {
  @override
  final _CounterPageController state;

  const _CounterPageView(
    this.state,
  ) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${state.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
