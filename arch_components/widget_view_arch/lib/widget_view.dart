// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally authored by GSkinner, detailed in this article:
//  https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html

/*  stateless
 class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _MyWidgetView();
 }

 class _MyWidgetView extends StatelessView<MyWidget> {
  const _MyWidgetView (this.state, {Key key}) : super(key: key);
   
  Widget build(BuildContext build){
     //Can easily handlers and params values on .widget
   }
 }
*/

/*  Stateful
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetController createState() => _MyWidgetController();
}
class _MyWidgetController extends State<MyWidget> {
  @override
  Widget build(BuildContext context) => _MyWidgetView(this);
}
class _MyWidgetView extends WidgetView<MyWidget, _MyWidgetController> {
  _MyWidgetController state;
  _MyWidgetView(_MyWidgetController state) : super(state);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
 */
import 'package:flutter/material.dart';

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;

  T1 get widget => (state as State).widget as T1;

  const WidgetView(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context);
}

// ignore: prefer-single-widget-per-file
abstract class StatelessView<T1> extends StatelessWidget {
  final T1 widget;

  const StatelessView(
    this.widget, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context);
}
