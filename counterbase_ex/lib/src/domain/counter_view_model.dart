// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: prefer_const_constructors



// Gist: We use specific sub-patterns that evolved from MVC to MVMM to help implement the
//       foundation of state management and those are:
//         Entity->Model->ViewModel
//
//       We use View Model to assist in separating out business logic from the presentation(i.e. view)

class CounterViewModel {
  int counter = 0;

  int increment() {
    

    return counter++;
  }

  int decrement() {
    return counter--;
  }
}
