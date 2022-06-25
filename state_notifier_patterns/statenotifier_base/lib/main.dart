import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:statenotifier_base/src/domain/console_logger.dart';
import 'package:statenotifier_base/src/domain/counter_model.dart';
import 'package:statenotifier_base/src/domain/counter_view_model.dart';
import 'package:statenotifier_base/src/domain/iapp_logger.dart';
import 'package:statenotifier_base/src/presentation/counter_tween.dart';
import 'package:statenotifier_base/src/presentation/my_app.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      Provider<IAppLogger>(create: (_) => ConsoleLogger(),),
      StateNotifierProvider<CounterViewModel, CounterModel>(
      create: (_) => CounterViewModel(),
      builder: (context, child,) {

        return TweenAnimationBuilder<CounterModel>(
          duration: const Duration(milliseconds: 500),
          tween: CounterTween(end: context.watch<CounterModel>()),
          builder: (context, state, child,) {
            return Provider.value(
              value: state, 
              child: MyApp(),);
          },
        );
      },),
    
    ],
    //child: MyApp(),
  ),);
}
