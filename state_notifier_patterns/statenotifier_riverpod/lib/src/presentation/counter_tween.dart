// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:statenotifier_riverpod/src/domain/counter_model.dart';


class CounterTween extends Tween<CounterModel> {
  CounterTween({
    CounterModel? begin,
    CounterModel? end,
  }) : super(
          begin: begin,
          end: end,
        );

  @override
  CounterModel lerp(double t) {
    final countTween = IntTween(
      begin: begin?.count,
      end: end?.count,
    );

    return CounterModel(countTween.lerp(t));
  }
}
