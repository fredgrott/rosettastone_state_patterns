// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:riverpod/riverpod.dart';

// Gist: Riverpod as a slight different service locator pattern as we submit the logger as 
//       a ProviderObserver to ProviderScaope in the runApp function

class RiverpodLogger extends ProviderObserver {

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

}