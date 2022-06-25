// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:equatable/equatable.dart';

class CounterModel  extends Equatable{
  final int count;

  const CounterModel(this.count);
  
  @override
  List<Object?> get props => [count];

  
}
